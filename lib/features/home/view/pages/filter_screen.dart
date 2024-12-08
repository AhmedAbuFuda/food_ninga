import 'package:flutter/material.dart';

import 'package:food_ninja/features/home/view/widgets/home_header.dart';
import 'package:food_ninja/features/home/view/widgets/search_button.dart';
import 'package:food_ninja/features/home/view/widgets/search_tab.dart';
import 'package:food_ninja/features/home/view/widgets/type_location_food_chips.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(),
                    SearchTab(),
                    ChipSelectionWidget(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: SearchButton(),
            ),
          ],
        ),
      ),
    );
  }
}
