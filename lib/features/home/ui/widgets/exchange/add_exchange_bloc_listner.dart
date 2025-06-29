import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_loading_indicator.dart';
import 'package:dentalink/features/home/logic/add_exchange_tool/add_exchange_tool_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExchangeBlocListner extends StatelessWidget {
  const AddExchangeBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddExchangeToolCubit, AddExchangeToolState>(
      listenWhen: (previous, current){
        return previous != current;
      },
      listener: (context, state) {
        if (state is AddExchangeToolLoading) {
          showDialog(
            context: context, 
            builder: (context) => const CustomLoadingIndicator()
          );
        } else if (state is AddExchangeToolSUccess) {
          context.pop();
          context.read<AddExchangeToolCubit>().resetState();
          showSuccessDialog(context);
        } else if (state is AddExchangeToolFailure) {
          setupErrorState(context, state.errMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  dynamic showSuccessDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sucess'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Your Tool was added successfully'),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                ),
                onPressed: () {
                  context.pushNamed(Routes.exchangeView);
                },
                child: const Text('Continue'),
              )
            ],
          );
        }
      );
  }

      void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: CustomTextStyles.font14BlackRegular(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
          ),
        ],
      ),
    );
  }
}
