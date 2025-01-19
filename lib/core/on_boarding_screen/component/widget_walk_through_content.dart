import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/on_boarding_screen/component/widget_dot_indicator.dart';
import 'package:chef_app/core/on_boarding_screen/component/widget_on_walk_through.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalkThroughContent extends StatelessWidget {
  const WalkThroughContent({
    super.key,
    required this.warlkThroughData,
    required this.pageIndex,
  });
  final int pageIndex;
  final List<WidgetOnWalkThrough> warlkThroughData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 12.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h),
            child: SizedBox(
              width: double.infinity,
              height: 250.h,
              child: Image.asset(warlkThroughData[pageIndex].image),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                warlkThroughData.length,
                (index) => WidgetDotIndicator(
                  isActive: index == pageIndex,
                ),
              ),
            ],
          ),
          const Spacer(),
          MainTextWidget(
            text: warlkThroughData[pageIndex].title,
            textStyle: regularStyle(fontSize: 20.sp),
          ),
          const SizedBox(
            height: 20,
          ),
          MainTextWidget(
            text: warlkThroughData[pageIndex].description,
            textStyle: regularStyle(),
          ),
          const Spacer(),
          pageIndex == 2
              ? MainButton(
                  text: "Done",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RouteNamedScreens.chooseLang);
                  },
                  isLoading: false)
              : const Icon(
                  size: 44,
                  Icons.arrow_right_alt_rounded,
                  color: AppColors.primaryColor,
                )
        ],
      ),
    );
  }
}
