import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/custom_image_edit.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/meal/presentation/widgets/custom_check_box_request_meal.dart';
import 'package:chef_app/features/meal/presentation/widgets/custom_category_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMealPage extends StatelessWidget {
  AddMealPage({super.key, this.imageProfile});
  bool isNumber = true;
  final String? imageProfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, context.addMeal),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageWithEdit(
                value: (vak) {},
                image: imageProfile,
              ),
              SizedBox(
                height: 25.h,
              ),
              MainTextFormField(
                text: context.name,
                vertical: 12.h,
                horizontal: 24.w,
                validate: (value) => Validate.generalValidate(context, value),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12.h,
                ),
                child: CustomCategoryDropDownButton(
                  categoryFunction: (String? value) {},
                ),
              ),
              MainTextFormField(
                text: context.price,
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
                        CustomCheckBoxRequestMeal(
                          text: context.quantity,
                          isCheacked: !isNumber,
                          ontap: () {
                            setState(
                              () {
                                isNumber = false;
                              },
                            );
                          },
                        ),
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
      ),
    );
  }
}
