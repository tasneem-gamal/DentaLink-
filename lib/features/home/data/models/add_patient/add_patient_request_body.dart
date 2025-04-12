import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart'; 

class AddPatientRequestBody {
  final String name;
  final int age;
  final String gender;
  final String phone;
  final String title;
  final String category;
  final String location;
  final String description;
  final List<File> images;

  AddPatientRequestBody({
    required this.name,
    required this.age,
    required this.gender,
    required this.phone,
    required this.title,
    required this.category,
    required this.location,
    required this.description,
    required this.images,
  });

  Future<FormData> toFormData() async {
    List<MultipartFile> multipartImages = [];

    for (File image in images) {
      if (!image.existsSync()) {
        debugPrint("Error: File does not exist at path: ${image.path}");
        return Future.error("File does not exist");
      }

      String fileName = image.path.split('/').last;
      String extension = fileName.split('.').last.toLowerCase();
      MediaType contentType = MediaType('image', extension);

      MultipartFile multipartImage = await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: contentType,
      );

      multipartImages.add(multipartImage);
    }

    FormData formData = FormData.fromMap({
      'name': name,
      'age': age,
      'gender': gender,
      'phone': phone,
      'title': title,
      'category': category,
      'location': location,
      'description': description,
      'images': multipartImages,  
    });

    return formData;
  }
}
