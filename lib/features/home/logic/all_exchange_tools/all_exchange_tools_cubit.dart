import 'package:dentalink/features/home/data/models/exchange/all_exchange_response_model.dart';
import 'package:dentalink/features/home/data/repo/all_exchange_tools.dart/all_exchange_tools_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_exchange_tools_state.dart';

class AllExchangeToolsCubit extends Cubit<AllExchangeToolsState> {
  AllExchangeToolsCubit(this.allExchangeToolsRepo) : super(AllExchangeToolsInitial());

  final AllExchangeToolsRepo allExchangeToolsRepo;

  List<ExchangeData> allExchangesList = [];

  void getexchanges() async{
    emit(AllExchangeToolsLoading());
    final response = await allExchangeToolsRepo.getAllExchangeTools();
    response.fold(
      (failure){
        emit(AllExchangeToolsFailure(failure.errMessage));
      },
      (allExchangesResponse){
        allExchangesList = allExchangesResponse.exchanges;
        emit(AllExchangeToolsSuccess(allExchangesList));
      }
    );
  }
}


