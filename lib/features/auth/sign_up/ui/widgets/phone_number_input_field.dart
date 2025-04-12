import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/auth/sign_up/logic/sign_cubit/sign_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberContainer extends StatefulWidget {
  const PhoneNumberContainer({super.key});

  @override
  State<PhoneNumberContainer> createState() => _PhoneNumberContainerState();
}

class _PhoneNumberContainerState extends State<PhoneNumberContainer> {
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  @override
  Widget build(BuildContext context)  {
    return Container(
      padding: const EdgeInsets.symmetric( vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.moreLightGray),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (number) {},
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN, 
          showFlags: true, 
          useEmoji: true, 
        ),
        ignoreBlank: false,
        autoValidateMode: autovalidateMode,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: number,
        textFieldController: context.read<SignCubit>().phoneController,
        formatInput: true,
        keyboardType: TextInputType.phone,
        inputDecoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Your number",
          hintStyle: TextStyle(color: ColorsManager.moreLightGray),
        ),
      ),
    );
  }
}
