import 'package:flutter/material.dart';
import '../../../../core/strings/image_png.dart';

class CustomImageWithEdit extends StatelessWidget {
  const CustomImageWithEdit(
      {super.key, required this.image, required this.ontap});
  final String? image;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: image != null
              ? Image.network(
                  image!,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                )
              : const SizedBox(),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: ontap,
            child: Image.asset(ImageString.editeImageProfile),
          ),
        ),
      ],
    );
  }
}
