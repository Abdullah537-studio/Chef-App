import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBodyMeal extends StatelessWidget {
  const ShowBodyMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 34.h,
      ),
      child: Column(
        children: [
          MainButton(
            text: "Add Meal",
            onTap: () {
              Navigator.pushNamed(context, RouteNamedScreens.addMealScreen);
            },
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
