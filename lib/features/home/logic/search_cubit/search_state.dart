part of 'search_cubit.dart';

class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSuccess extends SearchState {
  final List<PatientData> searchItems;

  SearchSuccess(this.searchItems);

}
class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}
