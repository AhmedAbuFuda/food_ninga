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
  List<RestaurantModel> searchRestaurants = [];
  List<MenuModel> searchItemsmenues = [];
  @override
  Widget build(BuildContext context) {
    void onSearch(String value) {
      if (value.isNotEmpty) {
        searchRestaurants = allRestaurants
            .where((element) => element.name.toLowerCase().startsWith(value))
            .toList();
        searchItemsmenues = allItemsmenues
            .where((element) => element.item.toLowerCase().startsWith(value))
            .toList();
        setState(() {});
      } else {
        searchRestaurants = [];
        searchItemsmenues = [];
        setState(() {});
      }
    }

    print('${searchRestaurants.length} +" "+ ${searchItemsmenues.length}');
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
                        ? Column(
                            children: [
                              (searchRestaurants.isNotEmpty)
                                  ? PopularRestaurant(
                                      restaurants: searchRestaurants)
                                  : const SizedBox(),
                              (searchItemsmenues.isNotEmpty)
                                  ? PopularMenu(menues: searchItemsmenues)
                                  : const SizedBox(),
                            ],
                          )
                        : const SizedBox(),
                    (state.typeFillter.contains('Restaurant'))
                        ? (searchRestaurants.isNotEmpty)
                            ? PopularRestaurant(restaurants: searchRestaurants)
                            : const SizedBox()
                        : const SizedBox(),
                    (state.typeFillter.contains('Menu'))
                        ? (searchItemsmenues.isNotEmpty)
                            ? PopularMenu(menues: searchItemsmenues)
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
