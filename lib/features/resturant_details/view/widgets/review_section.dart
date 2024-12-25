import 'package:flutter/material.dart';
import 'package:food_ninja/features/home/model/review_model.dart';
import 'package:food_ninja/features/resturant_details/view/widgets/card_review.dart';

class ReviewSection extends StatelessWidget {
  final List<ReviewModel> reviews;
  const ReviewSection({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 15,
              ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: reviews
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ReviewCard(
                      review: e,
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
