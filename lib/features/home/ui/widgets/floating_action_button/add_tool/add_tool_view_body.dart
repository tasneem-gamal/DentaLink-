import 'dart:io';

import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/home/data/models/add_tool/add_tool_request_body.dart';
import 'package:dentalink/features/home/logic/add_tool/add_tool_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_tool/add_tool_bloc_listner.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/description_form_field.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_tool/category_drop_down_menu_add_tool.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_tool/name_price_add_tool.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_tool/upload_tool_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToolViewBody extends StatefulWidget {
  const AddToolViewBody({super.key});

  @override
  State<AddToolViewBody> createState() => _AddToolViewBodyState();
}

class _AddToolViewBodyState extends State<AddToolViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> addToolFormKey = GlobalKey();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isFileUploaded = false;
  final ValueNotifier<String> selectedCategory = ValueNotifier<String>('Diagnostic Tools');
  File? pickedFile;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Form(
          key: addToolFormKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              verticalSpace(20),
              NamePriceAddTool(
                nameController: nameController,
                priceController: priceController,
              ),
              verticalSpace(16),
              const TitleOfTextField(title: 'Category'),
              verticalSpace(12),
              CategoryDropDownMenuAddTool(
                selectedValue: selectedCategory,
              ),
              verticalSpace(16),
              DescriptionFormField(
                hintText: 'ex. Reflects light for better visibility during procedures.',
                descriptionController: descriptionController,
              ),
              verticalSpace(16),
              UploadToolImages(
                onFileUploaded: setFileUploaded,
                onFileSelected: (file){
                  pickedFile = file;
                },
              ),
              verticalSpace(16),
              CustomAppButton(
                onPressed: () => validateThenAddTool(context),
                btnText: 'Add'
              ),
              const AddToolBlocListner()
            ],
          )
        )
      ),
    );
  }

      void setFileUploaded(bool value) {
    setState(() {
      isFileUploaded = value;
    });
  }

    void validateThenAddTool(BuildContext context) {
  if (addToolFormKey.currentState!.validate()) {
    final addToolBody = AddToolRequestBody(
      name: nameController.text,
      price: priceController.text,
      category: selectedCategory.value, 
      description: descriptionController.text,
      images: isFileUploaded && pickedFile != null ? [pickedFile!] : null,
    );

    context.read<AddToolCubit>().addTool(addToolBody);
  }
}

  void updateFileUploadStatus(bool uploaded) {
    setState(() {
      isFileUploaded = uploaded;
    });
  }

}

