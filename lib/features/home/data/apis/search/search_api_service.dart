import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';

class SearchApiService {
  late Dio dio;
  SearchApiService() {
    dio = DioFactory.getDio();
  }

  Future<Map<String, dynamic>> searchService() async {
    try {
      final response =
          await dio.get('${ApiConstants.baseUrl}${ApiConstants.search}');
      return response.data;
    } catch (e) {
      throw Exception('Failed to Search: $e');
    }
  }
}
