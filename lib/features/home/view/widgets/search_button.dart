import 'package:flutter/material.dart';

import 'package:food_ninja/features/home/view/pages/search_screen.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: Text(
              'Search',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
