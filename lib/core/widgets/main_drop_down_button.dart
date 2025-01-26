import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';

class MainDropdownButtonFormField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;
  final T? value;
  final String? hint;
  final String? Function(T?)? validator;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function(bool)? onMenuStateChange;
  final Widget? icon;
  final double itemHeight;
  const MainDropdownButtonFormField({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    this.hint,
    this.validator,
    this.padding,
    this.margin,
    this.onMenuStateChange,
    required this.icon,
    required this.itemHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        child: DropdownButtonFormField<T>(
          itemHeight: itemHeight,
          // selectedItemBuilder: (context) => ,
          value: value,
          items: items,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          icon: icon,
          hint: hint != null
              ? MainTextWidget(
                  text: hint!,
                  textStyle: regularStyle(color: AppColors.greyColor),
                )
              : null,
          validator: validator,
          onChanged: (val) {
            if (onChanged != null) {
              onChanged!(val);
            }
          },
        ),
      ),
    );
  }
}
