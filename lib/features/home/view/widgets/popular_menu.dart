import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/home/model/menu_model.dart';
import 'package:food_ninja/features/home/presentation/get_restaurant_bloc/restaurant_bloc.dart';
import 'package:food_ninja/features/home/view/widgets/header_section.dart';
import 'package:food_ninja/features/home/view/widgets/menu_item.dart';

class PopularMenu extends StatelessWidget {
  const PopularMenu({super.key, this.menues});
  final List<MenuModel>? menues;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderSection(title: 'Popular Menu'),
        BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RestaurantLoaded) {
              if (menues != null) {
                return Column(
                  children: menues!.map((e) => MenuItem(item: e)).toList(),
                );
              } else {
                final meanu = state.restaurants.map((e) => e.menu).toList();
                return Column(
                  children: meanu.map((e) => MenuItem(item: e[0])).toList(),
                );
              }
            } else if (state is RestaurantError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Press to fetch menu.'));
          },
        ),
      ],
    );
  }
}
