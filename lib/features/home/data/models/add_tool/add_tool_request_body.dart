import 'dart:io';
import 'package:dio/dio.dart';

class AddToolRequestBody {
  final String name;
  final String price;
  final String category;
  final String description;
  final List<File>? images;

  AddToolRequestBody({
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.images,
  });

  Future<FormData> toFormData() async {
    List<MultipartFile> multipartImages = [];

    if (images != null && images!.isNotEmpty) {
      for (File image in images!) {
        if (!image.existsSync()) {
          return Future.error("File ${image.path} does not exist");
        }

        String fileName = image.path.split('/').last;

        MultipartFile multipartImage = await MultipartFile.fromFile(
          image.path,
          filename: fileName,
        );

        multipartImages.add(multipartImage);
      }
    }

    return FormData.fromMap({
      'toolName': name,
      'price': price,
      'category': category,
      'description': description,
      if (multipartImages.isNotEmpty) 'images': multipartImages,
    });
  }

}
