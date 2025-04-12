import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/bottom_sheet_add/text_fields.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/bottom_sheet_add/upload_image_exchange_add.dart';
import 'package:flutter/material.dart';

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
                const TextFields(),
                verticalSpace(12),
                UploadImageExchangeAdd(
                  onFileUploaded: setFileUploaded,
                  onFileSelected: (file) {}
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

  void validateThenAddItem(BuildContext context){
    if(exchangeAddFormKey.currentState!.validate()){
      
    }
  }
}

