import 'dart:io';
import 'package:chef_app/core/function/pick_file_function.dart';
import 'package:flutter/material.dart';
import '../../../../core/strings/image_png.dart';

class CustomImageWithEdit extends StatefulWidget {
  const CustomImageWithEdit({
    super.key,
    required this.image,
    required this.value,
  });
  final String? image;
  final Function(File?)? value;
  @override
  State<CustomImageWithEdit> createState() => _CustomImageWithEditState();
}

class _CustomImageWithEditState extends State<CustomImageWithEdit> {
  File? imageEdit;

  @override
  void initState() {
    super.initState();
    if (widget.image != null) {
      imageEdit = File(widget.image!);
    }
  }

//? pick image from gallory
  void selectImage() async {
    await pickImage(
      (File file) {
        setState(() {
//? update image
          imageEdit = file;
        });
//? take value as File
        widget.value!(file);
      },
      (String baseName) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            width: 120,
            height: 120,
            child: imageEdit != null
                ? Image.file(
                    imageEdit!,
                    fit: BoxFit.cover,
                  )
                : widget.image != null
                    ? Image.network(
                        widget.image!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(ImageString.imageNotFound),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: selectImage,
            child: Image.asset(ImageString.editeImageProfile),
          ),
        ),
      ],
    );
  }
}
