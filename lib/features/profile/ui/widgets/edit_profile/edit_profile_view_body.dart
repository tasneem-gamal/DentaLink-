import 'package:dentalink/core/helpers/app_regex.dart';
import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/profile/ui/widgets/doctor_avatar.dart';
import 'package:dentalink/features/profile/ui/widgets/edit_profile/row_fields.dart';
import 'package:flutter/material.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final GlobalKey<FormState> editProfileFormKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Form(
          key: editProfileFormKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              verticalSpace(20),
              const DoctorAvatar(),
              verticalSpace(20),
              RowFields(
                title1: 'Name',
                hintText1: 'Mahmoud',
                title2: 'Email',
                hintText2: 'test@gmail.com',
                validator2: emailValidate,
              ),
              verticalSpace(18),
              RowFields(
                title1: 'Academic year',
                hintText1: 'final level',
                validator1: academicYearValidate,
                title2: 'Phone',
                hintText2: '0102556882',
                validator2: phoneValidate,
              ),
              verticalSpace(18),
              const TitleOfTextField(title: 'Password'),
              verticalSpace(6),
              CustomTextFormField(validator: passwordValidate, hintText: '********')
            ],
          ),
        )
      ),
    );
  }


  emailValidate(value) {
    if (!AppRegex.isEmailValid(value)) {
      return 'Enter a valid email address';
    }
  }

  academicYearValidate(value){
    if(value != 'final level' || value != 'level four'){
      return 'Enter a valid Academic Year';
    }
  }

  phoneValidate(value) {
    if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Enter a valid Phone';
    }
  }

  passwordValidate(value) {
    if (!AppRegex.hasLowerCase(value) &&
        !AppRegex.hasMinLength(value) &&
        !AppRegex.isPasswordValid(value) &&
        !AppRegex.hasSpecialCharacter(value)) {
      return "Enter a valid password: at least 8 characters,\nincluding one lowercase letter and one special char.";
    }
  }
}

