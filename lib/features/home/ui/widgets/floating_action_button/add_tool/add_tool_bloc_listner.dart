import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_loading_indicator.dart';
import 'package:dentalink/features/home/logic/add_tool/add_tool_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToolBlocListner extends StatelessWidget {
  const AddToolBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToolCubit, AddToolState>(
      listenWhen: (previous, current) => 
      current is AddToolLoading || 
      current is AddToolSuccess || 
      current is AddToolFailure,
      listener: (context, state) {
        if(state is AddToolLoading){
          showDialog(
            context: context, 
            builder: (context) => const CustomLoadingIndicator()
          );
        } else if (state is AddToolSuccess){
          context.pop();
          showSuccessDialog(context);
        } else if(state is AddToolFailure){
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
                  Text('Your tool was added successfully'),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  context.pushNamed(Routes.homeView);
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