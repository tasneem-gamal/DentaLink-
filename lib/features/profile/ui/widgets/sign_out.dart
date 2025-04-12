import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/font_weight_helper.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/profile/logic/sign_out_cubit/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignOut extends StatelessWidget {
  const SignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        signOutAlertDialog(context);
      },
      child: Row(
        children: [
          const Icon(
            Icons.logout,
            color: Colors.red,
          ),
          horizontalSpace(8),
          Text(
            'Sign Out',
            style: CustomTextStyles.font14BlackRegular(context)
                .copyWith(color: Colors.red),
          )
        ],
      ),
    );
  }

  void signOutAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            content: Text(
              'Hold on! Are you sure you’re ready to Sign out? Make sure everything’s saved.',
              style: CustomTextStyles.font14BlackRegular(context)
                  .copyWith(fontWeight: FontWeightHelper.medium),
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: ColorsManager.lightGray),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                  context.read<SignOutCubit>().emitSignOutStates();
                },
                child: Text(
                  'Sign Out',
                  style: CustomTextStyles.font14BlackRegular(context)
                      .copyWith(
                          fontWeight: FontWeightHelper.medium,
                          color: Colors.red),
                ),
              ),
            ],
          );
        });
  }
}
