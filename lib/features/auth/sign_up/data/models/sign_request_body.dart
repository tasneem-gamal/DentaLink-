import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart'; 

class SignRequestBody {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String academicYear;
  final String universityID;
  final File idPicture;
  final String role;

  SignRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.academicYear,
    required this.universityID,
    required this.idPicture,
    required this.role,
  });

  Future<FormData> toFormData() async {
    if (!idPicture.existsSync()) {
      debugPrint("Error: File does not exist at path: ${idPicture.path}");
      return Future.error("File does not exist");
    }

    String fileName = idPicture.path.split('/').last;
    String extension = fileName.split('.').last.toLowerCase();
    MediaType contentType = MediaType('image', extension);

    MultipartFile multipartImage = await MultipartFile.fromFile(
      idPicture.path,
      filename: fileName,
      contentType: contentType,
    );

    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'academicYear': academicYear,
      'universityID': universityID,
      'role': role,
      'idPicture': multipartImage,
    });

    return formData;
  }
}
