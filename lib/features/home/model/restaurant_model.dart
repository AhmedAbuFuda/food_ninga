import 'package:food_ninja/features/home/model/menu_model.dart';

class RestaurantModel {
  final double latitude;
  final String logo;
  final double longitude;
  final List<MenuModel> menu;
  final String name;
  final int time;

  RestaurantModel({
    required this.latitude,
    required this.logo,
    required this.longitude,
    required this.menu,
    required this.name,
    required this.time,
  });

  RestaurantModel.fromJson(Map<String, Object?> json)
      : this(
            latitude: json['latitude']! as double,
            logo: json['logo']! as String,
            longitude: json['longitude']! as double,
            menu: (json['menu']! as List)
                .map((e) => MenuModel.fromJson(e as Map<String, Object?>))
                .toList(),
            time: json['time']! as int,
            name: json['name']! as String);

  Map<String, Object?> toJson() {
    return {
      'latitude': latitude,
      'logo': logo,
      'longitude': longitude,
      'menu': menu.map((e) => e.toJson()).toList(),
      'name': name,
      'time': time
    };
  }
}
