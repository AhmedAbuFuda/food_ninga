import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/features/home/view/pages/search_screen.dart';
import 'package:food_ninja/features/home/view/widgets/fillter_item.dart';

class SearchFiliterHome extends StatelessWidget {
  const SearchFiliterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SearchScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(254, 246, 237, 1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search,
                        color: const Color.fromARGB(218, 99, 23, 1),
                        size: 25.sp),
                    SizedBox(width: 19.w),
                    Expanded(
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: "What do you want to order?",
                          hintStyle: Theme.of(context).textTheme.titleSmall,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          const Expanded(
            child: FillterItem(),
          )
        ],
      ),
    );
  }
}
