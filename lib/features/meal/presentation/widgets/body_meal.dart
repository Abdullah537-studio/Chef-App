import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_loading_indicator.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/get_meals_entitiy.dart';
import 'package:chef_app/features/meal/presentation/cubits/cubit/meal_cubit.dart';
import 'package:chef_app/features/meal/presentation/pages/add_meal_page.dart';
import 'package:chef_app/features/meal/presentation/widgets/custom_meal_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBodyMeal extends StatelessWidget {
  const ShowBodyMeal({super.key, required this.imageProfile});
  final String? imageProfile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 24.h,
      ),
      child: BlocConsumer<MealCubit, MealState>(
        listener: (context, state) {
          if (state.status == CubitStatus.error) {
            showToast(ToastMessageStatus.error, state.message);
          } else if (state.status == CubitStatus.loaded) {
            showToast(ToastMessageStatus.success, "success");
          }
        },
        builder: (context, state) {
          if (state.status == CubitStatus.loaded) {
            List<Meal> mealsDetailes = state.response?.meals ?? [];
            return Column(
              children: [
                MainButton(
                  text: context.addMeal,
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddMealPage(imageProfile: imageProfile),
                        ));
                  },
                  isLoading: false,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    itemCount: mealsDetailes.length,
                    itemBuilder: (context, index) {
                      return CustomMealComponent(
                        category: mealsDetailes[index].category,
                        name: mealsDetailes[index].name,
                        description: mealsDetailes[index].description,
                        mealImage: mealsDetailes[index].images.first,
                        price: mealsDetailes[index].price,
                        mealId: mealsDetailes[index].id,
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return MainLoadingIndicator();
          }
        },
      ),
    );
  }
}
