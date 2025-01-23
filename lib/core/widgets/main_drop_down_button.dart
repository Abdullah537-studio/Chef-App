import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/image_svg.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MainDropdownButtonFormField extends StatefulWidget {
  List<DropdownMenuItem<String>>? items;
  Color? colorIcon;

  final Function(String?) onChanged;
  final String label;
  MainDropdownButtonFormField({
    super.key,
    required this.onChanged,
    required this.items,
    required this.label,
  });

  @override
  _CustomDropdownButtonFormFieldState createState() =>
      _CustomDropdownButtonFormFieldState();
}

String? selectedValue;

class _CustomDropdownButtonFormFieldState
    extends State<MainDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2<String>(
          onMenuStateChange: (isOpen) {
            setState(() {
              if (isOpen == true) {
                widget.colorIcon = AppColors.primaryColor;
              } else {
                widget.colorIcon = AppColors.blackColor;
              }
            });
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.only(
              start: 5.w,
              top: 25.h,
              bottom: 25.h,
              end: 20.w,
            ),

            // AppSharedPreferences.getLanguageCode() == "ar"
            //     ? EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w)
            //     : EdgeInsets.only(
            //         top: 25.h, bottom: 25.h, right: 20.w, left: 5.w),
            hintStyle: Theme.of(context).textTheme.labelMedium,
            hintText: widget.label,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColors.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColors.redColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColors.primaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColors.blackColor,
              ),
            ),
          ),
          validator: (value) {
            return Validate.generalValidate(context, value);
          },
          isExpanded: true,
          iconStyleData: IconStyleData(
            // iconSize: 33,
            icon: Tab(
              child: SvgPicture.asset(
                ImageSvg.arrowIconDropDownButton,
                color: widget.colorIcon,
              ),
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                border: Border.all(color: AppColors.primaryColor, width: 2.w),
                borderRadius: BorderRadius.circular(10.r),
              ),
              maxHeight: 200.h,
              offset: Offset(0.w, -5.h)),
          hint: MainTextWidget(
            text: widget.label,
            textStyle: regularStyle(color: AppColors.greyColor),
          ),
          items: widget.items,
          value: selectedValue,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
