import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSettingProfile extends StatelessWidget {
  const CustomSettingProfile({
    super.key,
    required this.text,
    required this.image,
    required this.ontap,
  });
  final String text;
  final String image;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          SvgPicture.asset(image),
          MainTextWidget(text: text, textStyleEnum: TextStyleEnum.normal)
        ],
      ),
    );
  }
}
