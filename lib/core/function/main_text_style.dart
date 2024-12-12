import 'package:chef_app/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.lato(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

// bold style
TextStyle boldStyle({
  Color color = AppColors.whiteColor,
  double fontSize = 24,
}) {
  return _textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
  );
}

// normal title  style
TextStyle regularStyle({
  Color color = AppColors.blackColor,
  double fontSize = 16,
}) {
  return _textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.normal,
  );
}
