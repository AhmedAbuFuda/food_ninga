import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/features/home/view/pages/filter_screen.dart';

class FillterItem extends StatelessWidget {
  const FillterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: const Color.fromRGBO(254, 246, 237, 1)),
      child: IconButton(
        padding: EdgeInsets.all(20.r),
        icon: const Icon(Icons.view_list_rounded,
            color: Color.fromARGB(218, 99, 23, 1)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const FilterScreen()));
        },
      ),
    );
  }
}
