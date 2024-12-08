import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ninja/features/home/model/restaurant_model.dart';

class RestaurantRepo {
  Future<List<RestaurantModel>> getNearestRestaurants() async {
    final restaurantRef = FirebaseFirestore.instance
        .collection('restaurant')
        .withConverter<RestaurantModel>(
          fromFirestore: (snapshot, _) =>
              RestaurantModel.fromJson(snapshot.data()!),
          toFirestore: (restaurant, _) => restaurant.toJson(),
        );

    List<QueryDocumentSnapshot<RestaurantModel>> snapShot =
        await restaurantRef.get().then((snapshot) => snapshot.docs);
    final restaurants = snapShot.map((e) => e.data()).toList();

    return restaurants;
  }
}
