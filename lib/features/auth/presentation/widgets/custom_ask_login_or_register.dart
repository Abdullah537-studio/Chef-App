import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';

class CustomAskLoginOrRegister extends StatelessWidget {
  const CustomAskLoginOrRegister(
      {super.key,
      required this.textAsk,
      required this.textNavigate,
      this.ontap});
  final String textAsk;
  final String textNavigate;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MainTextWidget(
          text: textAsk,
          textStyleEnum: TextStyleEnum.medium,
        ),
        TextButton(
          onPressed: ontap,
          child: MainTextWidget(
            text: textNavigate,
            textStyleEnum: TextStyleEnum.textMainColor,
          ),
        )
      ],
    );
  }
}
