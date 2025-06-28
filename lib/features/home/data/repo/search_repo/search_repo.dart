import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/home/data/apis/search_api_service.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';

class SearchRepo {
  final SearchApiService searchApiService;

  SearchRepo(this.searchApiService);

  Future<Either<Failure, List<PatientData>>> search(
      {required String query}) async {
    try {
      final response = await searchApiService.searchService(query: query);
      List<PatientData> searchItems = [];
      for (var item in response) {
        searchItems.add(PatientData.fromJson(item));
      }
      return right(searchItems);
    } catch (e) {
      
      return left(ServerFailure(e.toString()));
    }
  }
}
