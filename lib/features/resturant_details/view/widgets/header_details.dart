import 'package:flutter/material.dart';
import 'package:food_ninja/features/resturant_details/view/pages/map_screen.dart';

class HeaderDetails extends StatefulWidget {
  const HeaderDetails(
      {super.key, required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;

  @override
  State<HeaderDetails> createState() => _HeaderDetailsState();
}

class _HeaderDetailsState extends State<HeaderDetails> {
  var color = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text('Popular',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 12.0,
                    color: Theme.of(context).primaryColor,
                  )),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: IconButton(
            icon: const Icon(Icons.location_pin),
            color: Theme.of(context).primaryColor,
            iconSize: 30.0,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MapScreen(
                      latitude: widget.latitude, longitude: widget.longitude),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 10.0),
        Container(
          decoration: BoxDecoration(
            color: color[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: IconButton(
            icon: const Icon(Icons.favorite),
            color: color,
            iconSize: 30.0,
            onPressed: () {
              setState(() {
                (color == Colors.green)
                    ? color = Colors.red
                    : color = Colors.green;
              });
            },
          ),
        ),
      ],
    );
  }
}
