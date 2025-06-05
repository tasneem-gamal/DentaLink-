import 'package:bloc/bloc.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_response_model.dart';
import 'package:dentalink/features/cart/data/repo/add_to_cart_repo.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.addToCartRepo) : super(AddToCartInitial());

  final AddToCartRepo addToCartRepo;

  Future<void> emitAddToCartStates(List<Tool> tools) async {
    emit(AddToCartLoading());
    try {
      final requestModel = AddToCartRequestModel(tools: tools);
      final response = await addToCartRepo.addToCart(requestModel);

      response.fold(
        (failure) => emit(AddToCartFailure(failure.errMessage)),
        (success) => emit(AddToCartSuccess(success)),
      );
    } catch (e) {
      emit(AddToCartFailure("Invalid"));
    }
  }
}
