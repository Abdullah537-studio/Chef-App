import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetDotIndicator extends StatelessWidget {
  const WidgetDotIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.greyColor,
        // border: Border.all(),
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(44.r),
      ),
      child: const SizedBox(),
    );
  }
}
