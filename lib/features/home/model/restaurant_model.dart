import 'package:food_ninja/features/home/model/menu_model.dart';
import 'package:food_ninja/features/home/model/review_model.dart';

class RestaurantModel {
  final double latitude;
  final String logo;
  final double longitude;
  final List<MenuModel> menu;
  final List<ReviewModel> reviews;
  final String name;
  final int time;
  final String description;
  final double stars;

  RestaurantModel({
    required this.latitude,
    required this.logo,
    required this.longitude,
    required this.menu,
    required this.reviews,
    required this.name,
    required this.time,
    required this.description,
    required this.stars,
  });

  RestaurantModel.fromJson(Map<String, Object?> json)
      : this(
          latitude: json['latitude']! as double,
          logo: json['logo']! as String,
          longitude: json['longitude']! as double,
          menu: (json['menu']! as List)
              .map((e) => MenuModel.fromJson(e as Map<String, Object?>))
              .toList(),
          reviews: (json['reviews']! as List)
              .map((e) => ReviewModel.fromJson(e as Map<String, Object?>))
              .toList(),
          time: json['time']! as int,
          name: json['name']! as String,
          description: json['description']! as String,
          stars: json['stars']! as double,
        );

  Map<String, Object?> toJson() {
    return {
      'latitude': latitude,
      'logo': logo,
      'longitude': longitude,
      'menu': menu.map((e) => e.toJson()).toList(),
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'name': name,
      'time': time,
      'description': description,
      'stars': stars,
    };
  }
}
