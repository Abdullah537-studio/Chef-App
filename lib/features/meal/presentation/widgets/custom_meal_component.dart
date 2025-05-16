import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMealComponent extends StatelessWidget {
  const CustomMealComponent({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.mealImage,
    required this.mealId,
  });
  final String name;
  final String description;
  final int price;
  final String category;
  final String mealImage;
  final String mealId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: SizedBox(
              height: 85.h,
              width: 85.h,
              child: Image.network(
                mealImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainTextWidget(
                text: name.length > 8 ? "${name.substring(0, 8)}..." : name,
                textStyle:
                    boldStyle(color: AppColors.primaryColor, fontSize: 18.sp),
              ),
              MainTextWidget(
                text: description.length > 8
                    ? "${description.substring(0, 8)}..."
                    : description,
                textStyle: regularStyle(fontSize: 14.sp),
              ),
              MainTextWidget(
                text: "$price USD",
                textStyle: regularStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              showToast(
                ToastMessageStatus.warning,
                "You are not allowed to delete this meal ! ",
              );
            },
            child: const SizedBox(
              width: 48,
              height: 48,
              child: Icon(
                Icons.cancel_outlined,
                color: AppColors.errorValidateColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
