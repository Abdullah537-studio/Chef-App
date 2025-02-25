import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/on_boarding_screen_2/build_screen_on_boarding_screen.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({super.key});

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomSheet: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: isLastPage
            ? TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNamedScreens.chooseLang);
                },
                child: MainTextWidget(
                  text: "Get Started",
                  textStyle: boldStyle(color: AppColors.orangeColor),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: MainButton(
                      text: "skip",
                      onTap: () {
                        controller.jumpToPage(2);
                      },
                      isLoading: false,
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: AppColors.blackColor,
                        activeDotColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: MainButton(
                      text: "next",
                      onTap: () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      isLoading: false,
                    ),
                  ),
                ],
              ),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            isLastPage = index == 2;
          });
        },
        children: [
          buildScreenOnBoardingScreen(
            title: "title 1",
            description: "description 1",
            image: ImageString.chefImage,
            context: context,
          ),
          buildScreenOnBoardingScreen(
            title: "title 2",
            description: "description 2",
            image: ImageString.chefImage,
            context: context,
          ),
          buildScreenOnBoardingScreen(
            title: "title 3",
            description: "description 3",
            image: ImageString.chefImage,
            context: context,
          ),
        ],
      ),
    );
  }
}
