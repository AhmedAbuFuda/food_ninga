import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/features/home/model/menu_model.dart';

class MenuItem extends StatelessWidget {
  final MenuModel item;
  const MenuItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: const Color.fromRGBO(255, 255, 255, 1),
      margin: EdgeInsets.only(
          bottom: 16.sp, right: screenWidth * 0.05, left: screenWidth * 0.05),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Row(
          children: [
            Image.network(
              item.image,
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              fit: BoxFit.cover,
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
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Icon(
                  Icons.error,
                  size: screenWidth * 0.15,
                );
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.item,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: screenWidth * 0.045,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.restaurant,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: screenWidth * 0.035,
                        ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Text(
              '\$${item.price}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color.fromRGBO(254, 173, 29, 1),
                    fontSize: screenWidth * 0.05,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
