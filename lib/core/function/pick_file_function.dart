import 'dart:io';
import 'package:image_picker/image_picker.dart';

// Future<void> pickImage(
//     Function(File) function, Function(String) updateBaseName) async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     File image = File(pickedFile.path);
//     function(image);

//     String baseName = image.path.split('/').last;
//     updateBaseName(baseName);
//   }
// }

Future<void> pickImage(
  // Function(File?)? onImageSelected,
  File? imageFile,
) async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    imageFile = File(pickedFile.path);
    // onImageSelected?.call(imageFile);
  }
}
