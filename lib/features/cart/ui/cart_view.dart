import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/features/cart/ui/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CartViewBody(),
      floatingActionButton: CustomAppButton(
        buttonWidth: MediaQuery.of(context).size.width * 0.4,
        btnText: 'Checkout',
        onPressed: (){
          context.pushNamed(Routes.checkoutConfirmView);
        },
      ),
    );
  }
}