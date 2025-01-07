import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

// Future<void> uploadFileHttp(File file) async {
//   try {
//     var uri = Uri.parse('https://example.com/upload');
//     var request = http.MultipartRequest('POST', uri);

//     var multipartFile = await http.MultipartFile.fromPath('file', file.path);
//     request.files.add(multipartFile);

//     var response = await request.send();

//     if (response.statusCode >= 200 && response.statusCode <= 300) {
//       debugPrint('success');
//     } else {
//       debugPrint(response.statusCode.toString());
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
// }
Future<void> uploadFileDio(File file) async {
  try {
    var dio = Dio();
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
    });

    var response = await dio.post('https://example.com/upload', data: formData);

    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! <= 300) {
      debugPrint('success');
    } else {
      debugPrint(response.statusCode.toString());
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
