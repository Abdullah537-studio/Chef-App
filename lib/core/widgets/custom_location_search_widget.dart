import 'package:chef_app/core/function/flutter_map.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
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

  const LocationSearchWidget(
      {super.key,
      required this.onLocationSelected,
      required this.controller,
      required this.text,
      this.validate});

  @override
  _LocationSearchWidgetState createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends State<LocationSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<LocationModel>(
      builder: (context, controller, focusNode) {
        return MainTextFormField(
            text: widget.text,
            vertical: 14.h,
            horizontal: 26.w,
            validate: widget.validate);
      },
      controller: widget.controller,
      suggestionsCallback: (pattern) async {
        if (pattern.isNotEmpty) {
          return await fetchLocations(pattern);
        }
        return [];
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion.name),
          subtitle: Text(suggestion.address),
        );
      },
      onSelected: (suggestion) {
        setState(() {
          widget.controller.text = suggestion.address;
        });
        // استدعاء الـ callback وتمرير الموقع المختار إلى صفحة التسجيل
        widget.onLocationSelected(suggestion);
      },
    );
  }
}
