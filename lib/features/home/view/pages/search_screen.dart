import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/home/model/menu_model.dart';
import 'package:food_ninja/features/home/model/restaurant_model.dart';
import 'package:food_ninja/features/home/model/restaurant_repo.dart';
import 'package:food_ninja/features/home/presentation/fillter_bloc/bloc/fillter_bloc.dart';
import 'package:food_ninja/features/home/presentation/get_restaurant_bloc/restaurant_bloc.dart';
import 'package:food_ninja/features/home/view/widgets/fillter_item.dart';
import 'package:food_ninja/features/home/view/widgets/home_header.dart';
import 'package:food_ninja/features/home/view/widgets/popular_menu.dart';
import 'package:food_ninja/features/home/view/widgets/popular_restaurant.dart';
import 'package:food_ninja/features/home/view/widgets/search_tab.dart';
import 'package:food_ninja/features/home/view/widgets/selected_fillter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  List<RestaurantModel> allRestaurants = [];
  List<MenuModel> allItemsmenues = [];
  @override
  Widget build(BuildContext context) {
    void onSearch(String value) {
      allRestaurants = allRestaurants
          .where((element) => element.name.toLowerCase().startsWith(value))
          .toList();
      allItemsmenues = allItemsmenues
          .where((element) => element.item.toLowerCase().startsWith(value))
          .toList();
      setState(() {});
    }

    return BlocProvider(
      create: (context) =>
          RestaurantBloc(RestaurantRepo())..add(FetchNearestRestaurants()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<FillterBloc, FillterState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    BlocBuilder<RestaurantBloc, RestaurantState>(
                      builder: (context, state) {
                        if (state is RestaurantLoaded) {
                          allRestaurants = state.restaurants;
                          final menues =
                              state.restaurants.map((e) => e.menu).toList();
                          allItemsmenues =
                              menues.expand((element) => element).toList();
                        }
                        return Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: SearchTab(
                                controller: controller,
                                onChangedText: onSearch,
                              ),
                            ),
                            const Expanded(
                              child: FillterItem(),
                            )
                          ],
                        );
                      },
                    ),
                    const SelectedFillter(),
                    (state.typeFillter.isEmpty)
                        ? (controller.text.isNotEmpty &&
                                allRestaurants.isNotEmpty)
                            ? PopularRestaurant(restaurants: allRestaurants)
                            : (allItemsmenues.isNotEmpty &&
                                    controller.text.isNotEmpty)
                                ? PopularMenu(menues: allItemsmenues)
                                : const SizedBox()
                        : const SizedBox(),
                    (state.typeFillter.contains('Restaurant'))
                        ? (controller.text.isNotEmpty &&
                                allRestaurants.isNotEmpty)
                            ? PopularRestaurant(restaurants: allRestaurants)
                            : const SizedBox()
                        : const SizedBox(),
                    (state.typeFillter.contains('Menu'))
                        ? (controller.text.isNotEmpty &&
                                allItemsmenues.isNotEmpty)
                            ? PopularMenu(menues: allItemsmenues)
                            : const SizedBox()
                        : const SizedBox(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
