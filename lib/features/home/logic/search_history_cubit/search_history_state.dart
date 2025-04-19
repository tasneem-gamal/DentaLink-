part of 'search_history_cubit.dart';

class SearchHistoryState {}

class SearchHistoryInitial extends SearchHistoryState {}

class SearchHistoryLoaded extends SearchHistoryState {
  final List<String> history;

  SearchHistoryLoaded(this.history);
}