import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AddToolRequestBody {
  final String name;
  final String price;
  final String category;
  final String description;
  final File image;

  AddToolRequestBody({
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  Future<FormData> toFormData() async {
    if (!image.existsSync()) {
      debugPrint("Error: File does not exist at path: ${image.path}");
      return Future.error("File does not exist");
    }

    String fileName = image.path.split('/').last;

    MultipartFile multipartImage = await MultipartFile.fromFile(
      image.path,
      filename: fileName,
    );

    FormData formData = FormData.fromMap({
      'name': name,
      'price': price,
      'category': category,
      'description': description,
      'image': multipartImage,
    });

    return formData;
  }
}
