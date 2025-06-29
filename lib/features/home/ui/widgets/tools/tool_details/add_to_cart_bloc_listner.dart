import 'package:dentalink/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartBlocListner extends StatelessWidget {
  const AddToCartBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToCartCubit, AddToCartState>(
      listenWhen: (previous, current) =>
          current is AddToCartLoading ||
          current is AddToCartSuccess ||
          current is AddToCartFailure,
      listener: (context, state) {
        if (state is AddToCartLoading) {
        } else if (state is AddToCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Added to cart successfully")
            )
          ); 
        } else if (state is AddToCartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage))
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}