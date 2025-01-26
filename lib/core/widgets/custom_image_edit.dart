import 'package:flutter/material.dart';
import '../../../../core/strings/image_png.dart';

class CustomImageWithEdit extends StatelessWidget {
  const CustomImageWithEdit(
      {super.key, required this.image, required this.value});
  final String? image;

  final Function(String? val)? value;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
            child: SizedBox(
          width: 120,
          height: 120,
          child: image != null
              ? Image.network(
                  image!,
                  fit: BoxFit.cover,
                )
              : Image.asset(ImageString.imageNotFound),
        )),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: () {
              value!(image);
            },
            child: Image.asset(ImageString.editeImageProfile),
          ),
        ),
      ],
    );
  }
}
