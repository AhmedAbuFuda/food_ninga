import 'package:flutter/material.dart';
import 'package:food_ninja/features/home/model/restaurant_model.dart';
import 'package:food_ninja/features/resturant_details/view/widgets/details_draggable_sheet.dart';
import 'package:food_ninja/features/resturant_details/view/widgets/header_details.dart';
import 'package:food_ninja/features/resturant_details/view/widgets/name_description_details.dart';
import 'package:food_ninja/features/resturant_details/view/widgets/popular_menu_header.dart';
import 'package:food_ninja/features/resturant_details/view/widgets/popular_menu_list.dart';
import 'package:food_ninja/features/resturant_details/view/widgets/review_section.dart';

class ResturantDetailsScreen extends StatefulWidget {
  final RestaurantModel restaurant;
  const ResturantDetailsScreen({super.key, required this.restaurant});

  @override
  State<ResturantDetailsScreen> createState() => _ResturantDetailsScreenState();
}

class _ResturantDetailsScreenState extends State<ResturantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.network(
                widget.restaurant.logo,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return const Icon(
                    Icons.error,
                    size: 70,
                  );
                },
              ).image,
              fit: BoxFit.contain,
              alignment: Alignment.topCenter),
        ),
        child: DetailsDraggableSheet(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderDetails(
                  latitude: widget.restaurant.latitude,
                  longitude: widget.restaurant.longitude,
                ),
                const SizedBox(height: 20),
                NameDescriptionDetails(restaurant: widget.restaurant),
                const SizedBox(height: 20),
                const PopularMenuHeader(),
                PopularMenuList(
                  items: widget.restaurant.menu,
                ),
                const SizedBox(height: 20),
                ReviewSection(reviews: widget.restaurant.reviews),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
