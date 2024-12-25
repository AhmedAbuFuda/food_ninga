import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ninja/features/home/model/menu_model.dart';
import 'package:food_ninja/features/home/model/restaurant_model.dart';
import 'package:food_ninja/features/home/model/review_model.dart';

void testFirebase() async {
  final restaurantRef = FirebaseFirestore.instance
      .collection('restaurant')
      .withConverter<RestaurantModel>(
        fromFirestore: (snapshot, _) =>
            RestaurantModel.fromJson(snapshot.data()!),
        toFirestore: (restaurant, _) => restaurant.toJson(),
      );

  restaurantRef.add(RestaurantModel(
      latitude: 31.208268,
      longitude: 29.919635,
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1YZ7sdMl03gzEHbcLx0EOMexX3PLVEhmNLA&s",
      name: "The Crepery",
      time: 8,
      stars: 4.5,
      description:
          "The Crepery is a cozy and charming eatery in Egypt, known for its limited seating and welcoming atmosphere. Guests rave about the delicious offerings, including standout dishes like the amazing tomato soup, complemented by friendly and respectful service from the owner and staff.",
      menu: [
        MenuModel(
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgkSO9_qiwQtEe8xRV9MZGz8Ohizfhngk8Yw&s",
            item: "Tsunami Chicken",
            price: 135,
            restaurant: "The Crepery",
            type: "Main Course"),
        MenuModel(
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOEA7BiFONQia5wksz0WtKwAxfy3XKWj7hfg&s",
            item: "Sweet Crepes",
            price: 120,
            restaurant: "The Crepery",
            type: "Dessert"),
      ],
      reviews: [
        ReviewModel(
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5tghyngmtHxGLx1Dn5aO0Xvk4SBN9xvrxJw&s",
            name: "Sarah Johnson",
            date: "25 July 2024",
            review:
                "I had the ham & cheese crepe. It was delicious, but I felt it had too much diced ham. I enjoyed the cheese crepe after removing some of the ham.",
            rate: 5),
        ReviewModel(
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3WVmYbXwi09tHVUgdjgz5HtggaB9rhA3zrw&s",
            name: "Mika",
            date: "16 April 2024",
            review:
                "I tried the tomato basil crepe, and it really hit the spot! I’ve been into caprese lately, and this crepe was delicious",
            rate: 4),
        ReviewModel(
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxC3W8Nz3V5k4JCzJI14LzG5sEu_dJUWLvihbDltL81wrRN3ePMhgelzKehgvMy4Zpl6E&usqp=CAU",
            name: "Emily Chen",
            date: "10 June 2024",
            review:
                "I had the smoked salmon crepe, and it was fantastic. The flavors were well-balanced, and I was very satisfied with my meal.",
            rate: 4),
      ]));
}
