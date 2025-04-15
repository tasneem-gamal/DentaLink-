import 'package:bloc/bloc.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:dentalink/features/home/data/repo/search_repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> search(String query) async {
    emit(SearchLoading());
    var result = await searchRepo.search(query: query);
    result.fold(
      (failure) {
        emit(SearchFailure(failure.errMessage));
      }, 
      (searchItems) {
        emit(SearchSuccess(searchItems));
      }
    );
  }
}
