import 'dart:io';

import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/features/home/data/models/exchange/add_exchange_request_body.dart' show AddExchangeRequestBody;
import 'package:dentalink/features/home/logic/add_exchange_tool/add_exchange_tool_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/bottom_sheet_add/text_fields.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/bottom_sheet_add/upload_image_exchange_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({
    super.key,
  });

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
    bool isFileUploaded = false;
    final GlobalKey<FormState> exchangeAddFormKey = GlobalKey();
    final nameController = TextEditingController();
    final toothNameController = TextEditingController();
    final exchangeWithController = TextEditingController();
    final notesController = TextEditingController();
    final phoneController = TextEditingController();
    File? pickedFile;


  @override
  void dispose() {
    nameController.dispose();
    toothNameController.dispose();
    exchangeWithController.dispose();
    notesController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 24,
            right: 24,
            top: 24
          ),
          child: Form(
            key: exchangeAddFormKey,
            child: Column(
              children: [
                TextFields(
                  nameController: nameController,
                  toothNameController: toothNameController,
                  exchangeWithController: exchangeWithController,
                  notesController: notesController,
                  phoneController: phoneController,
                ),
                verticalSpace(12),
                UploadImageExchangeAdd(
                  onFileUploaded: setFileUploaded,
                  onFileSelected: (file) {
                    pickedFile = file;
                  }
                ),
                verticalSpace(24),
                CustomAppButton(
                  onPressed: (){
                    validateThenAddItem(context);
                  },
                  btnText: 'Submit'
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

    void setFileUploaded(bool value) {
    setState(() {
      isFileUploaded = value;
    });
  }

  void validateThenAddItem(BuildContext context) {
    if (exchangeAddFormKey.currentState!.validate()) {
      final addExchangeBody = AddExchangeRequestBody(
        name: nameController.text,
        toothName: toothNameController.text,
        exchangeWith: exchangeWithController.text,
        notes: notesController.text,
        contact: phoneController.text,
        images: isFileUploaded && pickedFile != null ? [pickedFile!] : null,
      );

      context.read<AddExchangeToolCubit>().addExchangeTool(addExchangeBody);

      context.pop();
    }
  }

}

