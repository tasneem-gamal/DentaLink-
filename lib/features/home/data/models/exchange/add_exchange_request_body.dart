import 'dart:io';
import 'package:dio/dio.dart';


class AddExchangeRequestBody {
  final String name;
  final String toothName;
  final String exchangeWith;
  final String notes;
  final String contact;
  final List<File>? images;

  AddExchangeRequestBody({
    required this.name,
    required this.toothName,
    required this.exchangeWith,
    required this.notes,
    required this.contact,
    this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'toothName': toothName,
      'exchangeWith': exchangeWith,
      'notes': notes,
      'contact': contact,
      if (images != null) 'images': images!.map((e) => e.path.split('/').last).toList(),
    };
  }

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
      'name': name,
      'toothName': toothName,
      'exchangeWith': exchangeWith,
      'notes': notes,
      'contact': contact,
      if (multipartImages.isNotEmpty) 'images': multipartImages,
    });
  }
}
