import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/tools/edit_tool_post_form_fields.dart';
import 'package:flutter/material.dart';

class EditToolPostBottomSheet extends StatelessWidget {
  const EditToolPostBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 24,
            right: 24,
            top: 24
          ),
          child: Form(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit Post',
                      style: CustomTextStyles.font16BlackMedium(context),
                    ),
                    GestureDetector(
                      onTap: (){context.pop();},
                      child: const Icon(Icons.cancel, color: ColorsManager.lightGray,)
                    )
                  ],
                ),
                verticalSpace(16),
                const EditToolPostFormFields(),
                verticalSpace(16),
                CustomAppButton(
                  onPressed: (){},
                  btnText: 'Edit'
                )
              ],
            )
          ),
        ),
      )
    );
  }
}

