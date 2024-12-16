import 'package:food_ninja/features/home/model/restaurant_model.dart';
import 'package:geolocator/geolocator.dart';

List sortRestaurantsByDistance(
    Position position, List<RestaurantModel> restaurants) {
  restaurants.sort((a, b) {
    double distanceA = Geolocator.distanceBetween(
        position.latitude, position.longitude, a.latitude, a.longitude);
    double distanceB = Geolocator.distanceBetween(
        position.latitude, position.longitude, b.latitude, b.longitude);
    return distanceA.compareTo(distanceB);
  });
  return restaurants;
}

double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  return Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000.0;
}
