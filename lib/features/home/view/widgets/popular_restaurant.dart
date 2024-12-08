import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/home/model/restaurant_model.dart';

import 'package:food_ninja/features/home/presentation/get_restaurant_bloc/restaurant_bloc.dart';
import 'package:food_ninja/features/home/view/widgets/header_section.dart';
import 'package:food_ninja/features/home/view/widgets/popular_resturent_view.dart';

class PopularRestaurant extends StatelessWidget {
  const PopularRestaurant({super.key, this.restaurants});
  final List<RestaurantModel>? restaurants;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const HeaderSection(title: 'Popular Restaurant'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocBuilder<RestaurantBloc, RestaurantState>(
            builder: (context, state) {
              if (state is RestaurantLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RestaurantLoaded) {
                if (restaurants != null) {
                  return PopularResturentView(restaurants: restaurants!);
                } else {
                  return PopularResturentView(
                    restaurants: state.restaurants,
                  );
                }
              } else if (state is RestaurantError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text('Press to fetch restaurants.'));
            },
          ),
        ),
      ],
    );
  }
}
