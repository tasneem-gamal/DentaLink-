import 'package:bloc/bloc.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';

part 'search_history_state.dart';

class SearchHistoryCubit extends Cubit<SearchHistoryState> {
  SearchHistoryCubit() : super(SearchHistoryInitial());

  Future<void> loadHistory() async {
    final history = await SharedPreferenceHelper.getStringList('search_history');
    emit(SearchHistoryLoaded(history));
  }

  Future<void> addSearchTerm(String term) async {
    List<String> history = await SharedPreferenceHelper.getStringList('search_history');
    if (!history.contains(term)) {
      history.insert(0, term);
      if (history.length > 10) history = history.sublist(0, 10);
      await SharedPreferenceHelper.setStringList('search_history', history);
      emit(SearchHistoryLoaded(history));
    }
  }

  Future<void> deleteSearchTerm(int index) async {
    List<String> history = await SharedPreferenceHelper.getStringList('search_history');
    history.removeAt(index);
    await SharedPreferenceHelper.setStringList('search_history', history);
    emit(SearchHistoryLoaded(history));
  }

  Future<void> clearHistory() async {
    await SharedPreferenceHelper.setStringList('search_history', []);
    emit(SearchHistoryLoaded([]));
  }
}