import 'package:flutter/material.dart';

class PopularMenuHeader extends StatelessWidget {
  const PopularMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Popular Menu',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 15,
              ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
          ),
          child:
              Text('View More', style: Theme.of(context).textTheme.labelSmall),
        ),
      ],
    );
  }
}
