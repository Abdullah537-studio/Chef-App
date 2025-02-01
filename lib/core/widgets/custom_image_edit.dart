import 'dart:io';
import 'package:chef_app/core/function/pick_file_function.dart';
import 'package:flutter/material.dart';
import '../../../../core/strings/image_png.dart';

class CustomImageWithEdit extends StatefulWidget {
  const CustomImageWithEdit({
    super.key,
    required this.imageNetwork,
    required this.value,
  });
  final String? imageNetwork;
  final Function(File?)? value;
  @override
  State<CustomImageWithEdit> createState() => _CustomImageWithEditState();
}

class _CustomImageWithEditState extends State<CustomImageWithEdit> {
  File? imageEdit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            width: 120,
            height: 120,
            child: imageEdit == null
                ? (widget.imageNetwork != null
                    ? Image.network(widget.imageNetwork!)
                    : Image.asset(ImageString.imageNotFound))
                : Image.file(
                    imageEdit!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: () {
              pickImage(imageEdit);
            },
            child: Image.asset(ImageString.editeImageProfile),
          ),
        ),
      ],
    );
  }
}
