import 'dart:io';

import 'package:image_picker/image_picker.dart';

void uploadFile(Function(File)? function) async {
  File? file;
  final ImagePicker imagePicker = ImagePicker();
  var pickedImage = await imagePicker.pickImage(
    source: ImageSource.gallery,
  );

  if (pickedImage != null) {
    file = File(pickedImage.path);
    // String fileName = file.path.split('/').last;

    function!(file);
  }
}
