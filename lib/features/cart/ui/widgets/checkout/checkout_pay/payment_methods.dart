import 'package:dentalink/core/helpers/app_regex.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/checkout_pay/build_radio_option.dart';
import 'package:flutter/material.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/widgets/custom_divider.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  String selectedPaymentMethod = 'credit_card';
  final GlobalKey<FormState> deliveryPaymentMethodFormKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.always;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.moreLightGray),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildRadioOption(
            value: 'credit_card',
            groupValue: selectedPaymentMethod,
            title: 'Credit card',
            description:
                'When you click on the "Pay" button, you will be directed to the bank’s website to complete the steps by entering the card information for the payment process.',
            onChanged: (value) {
              setState(() => selectedPaymentMethod = value!);
            },
          ),
          const CustomDivider(),
          BuildRadioOption(
            value: 'cash_on_delivery',
            groupValue: selectedPaymentMethod,
            title: 'Cash on delivery',
            onChanged: (value) {
              setState(() => selectedPaymentMethod = value!);
            },
          ),
          if (selectedPaymentMethod == 'cash_on_delivery')
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 16, top: 10),
              child: Form(
                key: deliveryPaymentMethodFormKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    CustomTextFormField(
                      validator: (value) {},
                      hintText: 'Address in details',
                      maxLines: 3,
                    ),
                    verticalSpace(8),
                    CustomTextFormField(
                      validator: phoneValidate,
                      hintText: 'Phone number',
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  phoneValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Phone cannot be empty';
    }
    if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Enter a valid Phone';
    }
  }
}

