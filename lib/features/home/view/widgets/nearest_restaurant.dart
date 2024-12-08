import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/features/home/helper/calculate_distance.dart';
import 'package:food_ninja/features/home/presentation/get_location_bloc/bloc/location_bloc.dart';
import 'package:food_ninja/features/home/presentation/get_restaurant_bloc/restaurant_bloc.dart';
import 'package:food_ninja/features/home/view/widgets/header_section.dart';
import 'package:food_ninja/features/home/view/widgets/restaurant_item.dart';

class NearestRestaurant extends StatelessWidget {
  const NearestRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderSection(title: 'Nearest Restaurant'),
        BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RestaurantLoaded) {
              final restaurants = state.restaurants;
              return BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LocationLoaded) {
                    final sortRestaurants =
                        sortRestaurantsByDistance(state.position, restaurants);
                    return SizedBox(
                      height: 194,
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: sortRestaurants.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: RestaurantItem(
                                  restaurant: sortRestaurants[index]),
                            ),
                          )),
                    );
                  }
                  return const Center(child: Text('Press to fetch location.'));
                },
              );
            } else if (state is RestaurantError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Press to fetch restaurants.'));
          },
        ),
      ],
    );
  }
}
