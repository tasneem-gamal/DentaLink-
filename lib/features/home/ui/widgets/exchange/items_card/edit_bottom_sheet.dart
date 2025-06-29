import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/bottom_sheet_add/text_fields.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/items_card/upload_image_exchange_edit.dart';
import 'package:flutter/material.dart';

class EditBottomSheet extends StatefulWidget {
  const EditBottomSheet({
    super.key,
  });

  @override
  State<EditBottomSheet> createState() => _EditBottomSheetState();
}

class _EditBottomSheetState extends State<EditBottomSheet> {
    bool isFileUploaded = false;
    final GlobalKey<FormState> exchangeEditFormKey = GlobalKey();

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
            key: exchangeEditFormKey,
            child: Column(
              children: [
                // TextFields(
                //   nameController: nameController,
                //   toothNameController: toothNameController,
                //   exchangeWithController: exchangeWithController,
                //   notesController: notesController,
                //   phoneController: phoneController,
                // ),
                verticalSpace(12),
                UploadImageExchangeEdit(
                  onFileUploaded: setFileUploaded,
                  onFileSelected: (file) {}
                ),
                verticalSpace(24),
                CustomAppButton(
                  onPressed: (){
                    validateThenAddItem(context);
                  },
                  btnText: 'Edit'
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

  void validateThenAddItem(BuildContext context){
    if(exchangeEditFormKey.currentState!.validate()){
      
    }
  }
}

