import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/remote/api_urls.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/features/meal/presentation/widgets/custom_meal_component.dart';
import 'package:flutter/material.dart';
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            MainButton(
              text: context.addMeal,
              onTap: () async {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) =>
                //           AddMealPage(imageProfile: imageProfile),
                //     ));
                CacheHelper cache = CacheHelper();
                String secondtoken =
                    await cache.getData(key: ApiKey.token) ?? "";
                String token = "FOODAPI $secondtoken";
                String id = await cache.getData(key: ApiKey.id) ?? "";
                debugPrint(token);
                debugPrint(id);
              },
              isLoading: false,
            ),
            const SizedBox(
              height: 24,
            ),
            const CustomMealComponent(),
            const CustomMealComponent(),
            const CustomMealComponent(),
          ],
        ),
      ),
    );
  }
}
