import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/strings/image_png.dart';

class CustomShowImageProfile extends StatefulWidget {
  const CustomShowImageProfile({
    super.key,
    required this.imageNetwork,
    this.value,
  });
  final String? imageNetwork;
  final Function(File?)? value;
  @override
  State<CustomShowImageProfile> createState() => _CustomShowImageProfileState();
}

class _CustomShowImageProfileState extends State<CustomShowImageProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            width: 120,
            height: 120,
            child: widget.imageNetwork != null
                ? Image.network(widget.imageNetwork!)
                : Image.asset(ImageString.imageNotFound),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(ImageString.editeImageProfile),
        ),
      ],
    );
  }
}
