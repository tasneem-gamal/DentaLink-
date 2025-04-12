import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/auth/sign_up/logic/sign_cubit/sign_cubit.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/email_field_sign.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/academic_and_student_id_sign.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/name_field.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/password_and_confirm_password_field.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/phone_number_input_field.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/upload_title_and_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  
  
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isFileUploaded = false;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignCubit>().signFormKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const NameField(),
          verticalSpace(14),
          const AcademicAndStudentIdSign(),
          verticalSpace(14),
          const EmailFieldSign(),
          verticalSpace(14),
          const PasswordAndConfirmPasswordField(),
          verticalSpace(14),
          const TitleOfTextField(
            title: 'Phone number',
          ),
          verticalSpace(14),
          const PhoneNumberContainer(),
          verticalSpace(14),
          UploadTitleAndContainer(
            onFileUploaded: setFileUploaded,
            onFileSelected: (file) => context.read<SignCubit>().imageFile = file,
          ),
          verticalSpace(14),
        ],
      ),
    );
  }




  void setFileUploaded(bool value) {
    setState(() {
      isFileUploaded = value;
    });
  }

}



