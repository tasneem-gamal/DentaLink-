import 'package:bloc/bloc.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_response_model.dart';
import 'package:dentalink/features/cart/data/repo/get_cart_items_repo.dart';

part 'get_cart_items_state.dart';

class GetCartItemsCubit extends Cubit<GetCartItemsState> {
  GetCartItemsCubit(this.getCartItemsRepo) : super(GetCartItemsInitial());

  final GetCartItemsRepo getCartItemsRepo;
  List<CartItem> cartItemsList = [];

  void getCartItems() async{
    emit(GetCartItemsLoading());
    final response = await getCartItemsRepo.getCartItems();
    response.fold(
      (failure){
        emit(GetCartItemsFailure(failure.errMessage));
      },
      (getCartItems){
        cartItemsList = getCartItems.cart.items;
        emit(GetCartItemsSuccess(cartItemsList));
      }
    );
  }
}
