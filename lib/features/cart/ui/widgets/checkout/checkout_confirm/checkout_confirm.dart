import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/checkout_confirm/checkout_confirm_body.dart';
import 'package:flutter/material.dart';

class CheckoutConfirm extends StatelessWidget {
  const CheckoutConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralCustomAppBar(title: 'Checkout'),
      body: const CheckoutConfirmBody(),
      bottomNavigationBar: Padding(
        padding: Constants.appPadding,
        child: CustomAppButton(
          btnText: 'Confirm',
          onPressed: (){
            context.pushNamed(Routes.checkoutPayView);
          },
        ),
      ),
    );
  }
}