import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/home/helper/calculate_distance.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double _latitude = 0.0;
  double _longitude = 0.0;
  TextEditingController controller = TextEditingController();
  List<RestaurantModel> allRestaurants = [];
  List<MenuModel> allItemsmenues = [];
  List<RestaurantModel> searchRestaurants = [];
  List<MenuModel> searchItemsmenues = [];

  @override
  @override
  void initState() {
    super.initState();
    _loadlatitude();
    _loadlongitude();
  }

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

    return BlocProvider(
      create: (context) =>
          RestaurantBloc(RestaurantRepo())..add(FetchNearestRestaurants()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<FillterBloc, FillterState>(
              builder: (context, state) {
                if (state.locationFillter.isNotEmpty) {
                  (!state.locationFillter.contains('>10 Km'))
                      ? searchRestaurants = searchRestaurants
                          .where((e) =>
                              calculateDistance(e.latitude, e.longitude,
                                  _latitude, _longitude) <=
                              double.parse(state.locationFillter.first
                                  .replaceAll(" Km", '')
                                  .replaceAll('<', '')
                                  .replaceAll('>', '')))
                          .toList()
                      : searchRestaurants = searchRestaurants
                          .where((e) =>
                              calculateDistance(e.latitude, e.longitude,
                                  _latitude, _longitude) >=
                              double.parse(state.locationFillter.first
                                  .replaceAll(" Km", '')
                                  .replaceAll('<', '')
                                  .replaceAll('>', '')))
                          .toList();
                  final meanu = searchRestaurants.map((e) => e.menu).toList();
                  searchItemsmenues =
                      meanu.expand((element) => element).toList();
                }
                if (state.foodFillter.isNotEmpty) {
                  searchRestaurants=[];
                  searchItemsmenues = searchItemsmenues
                      .where((e) => state.foodFillter.contains(e.type))
                      .toList();
                }
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
                                enable: true,
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

  Future<void> _loadlatitude() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _latitude = prefs.getDouble('latitude') ?? 0.0;
    });
  }

  Future<void> _loadlongitude() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _longitude = prefs.getDouble('longitude') ?? 0.0;
    });
  }
}
