import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoAdvertising extends StatelessWidget {
  const PromoAdvertising({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 325 / 150,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Container(
          decoration: ShapeDecoration(
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/card_background.png')),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                  child: Image(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.fill,
              )),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Special Deal For October',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 10.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Buy Now',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 10.sp,
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
