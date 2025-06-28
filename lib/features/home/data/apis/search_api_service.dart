import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';

class SearchApiService {
  late Dio dio;
  SearchApiService() {
    dio = DioFactory.getDio();
  }

  Future<List<dynamic>> searchService({required String query}) async {
    try {
      final response = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.search}$query',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        ),
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to Search: $e');
    }
  }
}
