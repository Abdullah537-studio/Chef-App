import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickFileFunction() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}
