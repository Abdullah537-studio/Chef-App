import 'package:chef_app/core/function/flutter_map.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/widgets/main_loading_indicator.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:chef_app/core/model/location.dart';
// تأكد من تعريف دالة fetchLocations التي تُعيد Future<List<LocationModel>> بناءً على نص البحث.

class LocationSearchWidget extends StatefulWidget {
  final ValueChanged<LocationModel>
      onLocationSelected; // callback لتمرير الموقع المختار
  final TextEditingController controller;
  final String text;
  final String? Function(String?)? validate;

  const LocationSearchWidget({
    super.key,
    required this.onLocationSelected,
    required this.controller,
    required this.text,
    this.validate,
  });

  @override
  _LocationSearchWidgetState createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends State<LocationSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 26.w,
      ),
      child: TypeAheadField<LocationModel>(
        builder: (context, controller, focusNode) {
          return TextFormField(
              validator: widget.validate,
              controller: controller,
              focusNode: focusNode,
              autofocus: true,
              decoration: InputDecoration(
                hintText: widget.text,
              ));
          // MainTextFormField(
          //     text: widget.text,

          //     validate: widget.validate);
        },
        controller: widget.controller,
        suggestionsCallback: (pattern) async {
          if (pattern.isNotEmpty) {
            return await fetchLocations(pattern);
          }
          return [];
        },
        loadingBuilder: (context) => MainLoadingIndicator(),
        itemBuilder: (context, suggestion) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  title: MainTextWidget(
                    text: suggestion.name,
                    textStyle: boldStyle(
                        color: AppColors.darkCharcoal, fontSize: 16.sp),
                  ),
                  subtitle: MainTextWidget(
                    text: suggestion.address,
                    textStyle: regularStyle(
                        color: AppColors.greyColor, fontSize: 14.sp),
                  ),
                ),
              ),
            ],
          );
        },
        onSelected: (suggestion) {
          setState(() {
            widget.controller.text = suggestion.address;
          });
          // استدعاء الـ callback وتمرير الموقع المختار إلى صفحة التسجيل
          widget.onLocationSelected(suggestion);
        },
      ),
    );
  }
}
