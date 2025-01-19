import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/on_boarding_screen/component/widget_walk_through_content.dart';
import 'package:chef_app/core/on_boarding_screen/component/widget_on_walk_through.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<WidgetOnWalkThrough> walkThroughtData = [
      const WidgetOnWalkThrough(
          image: ImageString.chefImage,
          title: "title1",
          description: " description first"),
      const WidgetOnWalkThrough(
          image: ImageString.chefImage,
          title: "title2",
          description: " description second"),
      const WidgetOnWalkThrough(
          image: ImageString.chefImage,
          title: "title3",
          description: " description third"),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, RouteNamedScreens.chooseLang);
              },
              child: MainTextWidget(
                  text: context.skip,
                  textStyle: boldStyle(
                      color: AppColors.primaryColor, fontSize: 20.sp)),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        color: AppColors.whiteColor,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: walkThroughtData.length,
                controller: _pageController,
                onPageChanged: (index) {
                  _pageIndex = index;

                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return WalkThroughContent(
                    pageIndex: _pageIndex,
                    warlkThroughData: walkThroughtData,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
