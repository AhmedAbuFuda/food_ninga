import 'package:flutter/material.dart';
import 'package:food_ninja/features/home/model/restaurant_repo.dart';
import 'package:food_ninja/features/home/presentation/get_location_bloc/bloc/location_bloc.dart';
import 'package:food_ninja/features/home/presentation/get_restaurant_bloc/restaurant_bloc.dart';
import 'package:food_ninja/features/home/view/widgets/home_header.dart';
import 'package:food_ninja/features/home/view/widgets/nearest_restaurant.dart';
import 'package:food_ninja/features/home/view/widgets/popular_menu.dart';
import 'package:food_ninja/features/home/view/widgets/popular_restaurant.dart';
import 'package:food_ninja/features/home/view/widgets/promo_advertising.dart';
import 'package:food_ninja/features/home/view/widgets/search_filiter_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RestaurantBloc(RestaurantRepo())..add(FetchNearestRestaurants()),
        ),
        BlocProvider(
          create: (context) => LocationBloc()..add(FetchLocation()),
        ),
      ],
      child: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),
              SearchFiliterHome(),
              PromoAdvertising(),
              NearestRestaurant(),
              PopularMenu(),
              PopularRestaurant(),
            ],
          ),
        ),
      ),
    );
  }
}
