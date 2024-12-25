import 'package:flutter/material.dart';
import 'package:food_ninja/features/home/model/menu_model.dart';
import 'package:food_ninja/features/resturant_details/view/widgets/menu_item_card.dart';

class PopularMenuList extends StatelessWidget {
  final List<MenuModel> items;
  const PopularMenuList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 194,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 20),
          child: MenuItemCard(
            item: items[index],
          ),
        ),
      ),
    );
  }
}
