import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ninja/features/home/model/menu_model.dart';
import 'package:food_ninja/features/home/model/restaurant_model.dart';

void testFirebase() async {
  final restaurantRef = FirebaseFirestore.instance
      .collection('restaurant')
      .withConverter<RestaurantModel>(
        fromFirestore: (snapshot, _) =>
            RestaurantModel.fromJson(snapshot.data()!),
        toFirestore: (restaurant, _) => restaurant.toJson(),
      );

  restaurantRef.add(RestaurantModel(
    latitude: 31.228546,
    logo:
        'https://scontent.fcai20-5.fna.fbcdn.net/v/t39.30808-6/347137969_1682945488824698_8717883971510180764_n.png?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=mYAYrzmc1rIQ7kNvgEo8zzn&_nc_zt=23&_nc_ht=scontent.fcai20-5.fna&_nc_gid=AX7REMEuXPT0HLIzqT2V45r&oh=00_AYDadXAZoghfx9WRzfBjVH4WLxxXuQ2-KVMxQEsIdPubJg&oe=6764AB7C',
    longitude: 30.102384,
    menu: [
      MenuModel(
        item: 'Qashtota',
        image:
            'https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/387234952_723147576521611_5310440522406075797_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=127cfc&_nc_ohc=5zY6bBpBDo0Q7kNvgExIUg7&_nc_zt=23&_nc_ht=scontent.fcai20-1.fna&_nc_gid=AORqq4OcFjO271n8LUWVQ2x&oh=00_AYBttS4Ag0_e1v0II3lq7LcCsQRPvqKLhlDyNBERG7vutg&oe=6764B7D1',
        type: 'Dessert',
        price: 70,
        restaurant: 'B.Laban',
      ),
      MenuModel(
        item: 'Hiba Dubai',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4lPN6HZkYIByP0vGYtz3UUYvm1Z3tDFdkLw&s',
        type: 'Cake',
        price: 100,
        restaurant: 'B.Laban',
      )
    ],
    name: 'B.Laban',
    time: 10,
  ));
}
