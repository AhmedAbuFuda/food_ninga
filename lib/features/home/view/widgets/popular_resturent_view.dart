import 'package:flutter/material.dart';
import 'package:food_ninja/features/home/model/restaurant_model.dart';
import 'package:food_ninja/features/home/view/widgets/restaurant_item.dart';

class PopularResturentView extends StatelessWidget {
  const PopularResturentView({super.key, required this.restaurants});
  final List<RestaurantModel> restaurants;

  @override
  Widget build(BuildContext context) {
    return (restaurants.isNotEmpty)
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantItem(
                restaurant: restaurants[index],
              );
            },
          )
        : const SizedBox.shrink();
  }
}
