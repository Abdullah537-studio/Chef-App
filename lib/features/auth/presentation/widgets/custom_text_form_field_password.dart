import 'package:flutter/material.dart';

class CustomTextFormFieldPassword extends StatefulWidget {
  const CustomTextFormFieldPassword({
    super.key,
    required this.text,
    required this.onChanged,
    required this.controller,
    required this.horizontal,
    required this.vertical,
    required this.validate,
  });

  final String text;
  final double horizontal;
  final double vertical;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? Function(String?)? validate;
  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  bool showText = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontal,
        vertical: widget.vertical,
      ),
      child: TextFormField(
        validator: widget.validate,
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: !showText,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: widget.text,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                showText = !showText;
              });
            },
            child: showText
                ? const Icon(Icons.remove_red_eye_outlined)
                : const Icon(
                    Icons.remove_red_eye,
                  ),
          ),
        ),
      ),
    );
  }
}
