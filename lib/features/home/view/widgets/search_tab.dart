import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key, this.controller, this.onChangedText, this.enable});
  final TextEditingController? controller;
  final void Function(String)? onChangedText;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CupertinoSearchTextField(
        controller: controller,
        placeholder: 'What do you want to order?',
        placeholderStyle: Theme.of(context).textTheme.titleSmall,
        prefixInsets: EdgeInsets.only(left: 16.r),
        prefixIcon: const Icon(CupertinoIcons.search,
            color: Color.fromARGB(218, 99, 23, 1), size: 25),
        suffixInsets: const EdgeInsets.symmetric(horizontal: 16),
        suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
            color: Color.fromARGB(218, 99, 23, 1), size: 25),
        padding: EdgeInsets.all(20.w),
        borderRadius: BorderRadius.circular(10.r),
        backgroundColor: const Color.fromRGBO(254, 246, 237, 1),
        onChanged: (value) {
          onChangedText!(value);
        },
        enabled: enable,
      ),
    );
  }
}
