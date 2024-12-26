import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/remote/api_url.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';

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
            text: AppKeyTranslate.addMeal,
            onTap: () async {
              // Navigator.pushNamed(context, RouteNamedScreens.addMealScreen);
              CacheHelper cache = CacheHelper();
              String token = await cache.getData(key: ApiKey.token) ?? "";
              String id = await cache.getData(key: ApiKey.id) ?? "";
              debugPrint(token);
              debugPrint(id);
            },
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
