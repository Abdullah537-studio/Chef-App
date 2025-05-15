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
                    ? Image.network(
                        widget.imageNetwork!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        ImageString.imageNotFound,
                        fit: BoxFit.cover,
                      ))
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
            onTap: () async {
              // انتظار اختيار الملف
              File? file = await pickFileFunction();
              if (file != null) {
                setState(() {
                  imageEdit = file;
                });
                // تمرير الملف الجديد إلى الـ callback
                if (widget.value != null) {
                  widget.value!(file);
                }
              }
            },
            child: Image.asset(ImageString.editeImageProfile),
          ),
        ),
      ],
    );
  }
}
