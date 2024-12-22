import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';

class MainLoadingIndicator extends StatelessWidget {
  const MainLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColors.primaryColor,
    ));
  }
}
