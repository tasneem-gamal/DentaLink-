import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/home/logic/add_patient_cubit/add_patient_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_patient/add_patient_bloc_listner.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_patient/category_and_location_fields.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/description_form_field.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_patient/gender_radio_buttons.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_patient/name_title_age_fields.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_patient/phone_number_input_add_patient.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_patient/upload_patient_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPatientViewBody extends StatefulWidget {
  const AddPatientViewBody({super.key});

  @override
  State<AddPatientViewBody> createState() => _AddPatientViewBodyState();
}

class _AddPatientViewBodyState extends State<AddPatientViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isFileUploaded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Form(
          key: context.read<AddPatientCubit>().addPatientFormKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              verticalSpace(20),
              const NameTitleAgeFields(),
              verticalSpace(16),
              const GenderRadioButtons(),
              verticalSpace(16),
              const TitleOfTextField(title: 'Phone Number'),
              verticalSpace(12),
              const PhoneNumberInputAddPatient(),
              verticalSpace(16),
              const CategoryAndLocationFields(),
              DescriptionFormField(
                hintText: 'ex. Cavity in the back molar with intermittent pain',
                descriptionController: context.read<AddPatientCubit>().descriptionController,
              ),
              verticalSpace(16),
              UploadPatientImages(
                onFileUploaded: setFileUploaded,
                onFileSelected: (file){},
              ),
              verticalSpace(16),
              CustomAppButton(
                onPressed: () => validateThenAddPatient(context),
                btnText: 'Add'
              ),
              const AddPatientBlocListner()
            ],
          ),
        )
      ),
    );
  }
    void setFileUploaded(bool value) {
    setState(() {
      isFileUploaded = value;
    });
  }

  void validateThenAddPatient(BuildContext context){
    if(context.read<AddPatientCubit>().addPatientFormKey.currentState!.validate()){
      context.read<AddPatientCubit>().emitAddPetientStates();
    }
  }
  
}










