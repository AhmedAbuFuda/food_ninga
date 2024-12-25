import 'package:flutter/material.dart';
import 'package:food_ninja/features/home/helper/calculate_distance.dart';
import 'package:food_ninja/features/home/model/restaurant_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameDescriptionDetails extends StatefulWidget {
  final RestaurantModel restaurant;
  const NameDescriptionDetails({super.key, required this.restaurant});

  @override
  State<NameDescriptionDetails> createState() => _NameDescriptionDetailsState();
}

class _NameDescriptionDetailsState extends State<NameDescriptionDetails> {
  double _latitude = 0.0;
  double _longitude = 0.0;

  @override
  void initState() {
    super.initState();
    _loadlatitude();
    _loadlongitude();
  }

  @override
  Widget build(BuildContext context) {
    double distance = calculateDistance(widget.restaurant.latitude,
        widget.restaurant.longitude, _latitude, _longitude);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.restaurant.name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 27),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined,
                color: Theme.of(context).primaryColor),
            const SizedBox(width: 8),
            Text('${distance.toStringAsFixed(2)} Km',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(width: 20),
            Icon(Icons.star, color: Theme.of(context).primaryColor),
            const SizedBox(width: 8),
            Text('${widget.restaurant.stars} Rating',
                style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          widget.restaurant.description,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 12,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
        ),
      ],
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
