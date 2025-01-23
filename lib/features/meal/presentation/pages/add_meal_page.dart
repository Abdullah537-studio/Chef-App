import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/meal/presentation/widgets/custom_check_box_request_meal.dart';
import 'package:chef_app/features/meal/presentation/widgets/custom_category_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMealPage extends StatelessWidget {
  AddMealPage({super.key});
  bool isNumber = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, context.addMeal),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25.h, bottom: 12.h),
              width: 149,
              height: 151,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.greyColor,
              ),
              child: const SizedBox(),
            ),
            MainTextFormField(
              text: context.name,
              vertical: 12.h,
              horizontal: 24.w,
              validate: (value) => Validate.generalValidate(context, value),
            ),
            MainTextFormField(
              text: context.price,
              vertical: 12.h,
              horizontal: 24.w,
              validate: (value) => Validate.generalValidate(context, value),
            ),
            MainTextFormField(
              text: context.category,
              vertical: 12.h,
              horizontal: 24.w,
              validate: (value) => Validate.generalValidate(context, value),
            ),
            MainTextFormField(
              text: context.description,
              vertical: 12.h,
              horizontal: 24.w,
              validate: (value) => Validate.generalValidate(context, value),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 21.h),
              child: StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCheckBoxRequestMeal(
                        text: context.number,
                        isCheacked: isNumber,
                        ontap: () {
                          setState(
                            () {
                              isNumber = true;
                            },
                          );
                        },
                      ),
                      const CustomCategoryDropDownButton()
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 100.h,
                bottom: 72,
              ),
              child: MainButton(
                text: context.addMeal,
                onTap: () {},
                isLoading: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
