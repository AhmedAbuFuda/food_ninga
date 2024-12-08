import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.sp, left: 25.sp, right: 25.sp),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Find Your Favorite Food',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Expanded(
            child: CircleAvatar(
              backgroundColor: const Color(0xffFAFDFF),
              radius: 20.r,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.notifications_none,
                    color: Theme.of(context).primaryColor),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
