import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';

class MainButtonChooceLang extends StatelessWidget {
  const MainButtonChooceLang(
      {super.key, required this.onTap, required this.text});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 140,
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.black,
      child: MainTextWidget(
        text: text,
        textStyle: boldStyle(),
      ),
    );
  }
}
