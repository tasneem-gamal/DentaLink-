import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';

class RelatedToolsApiService {
  late Dio dio;
  RelatedToolsApiService(){
    dio = DioFactory.getDio();
  }

  

}