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
  String baseName = "";

  // File? file;

  // يجب أن يكون نوع القيمة File بدلاً من String
  void selectImage() {
    pickImage((file) {
      widget.value!(file);
      setState(() {
        imageEdit = file;
        // chooseNameOrEmpty = true;
        // errorValidateMessage = null;
        // widget.isValid = true;
      });
    }, (baseName) {
      setState(() {
        this.baseName = baseName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        widget.value!(
            imageEdit ?? (widget.image != null ? File(widget.image!) : null));
        return Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: SizedBox(
                width: 120,
                height: 120,
                child: imageEdit == null
                    ? widget.image != null
                        ? Image.network(
                            widget.image!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(ImageString.imageNotFound)
                    : Image.file(imageEdit!),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {
                  selectImage();
                },
                child: Image.asset(ImageString.editeImageProfile),
              ),
            ),
          ],
        );
      },
    );
  }
}
