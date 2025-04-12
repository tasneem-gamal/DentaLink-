import 'package:dentalink/features/auth/sign_up/data/models/uploaded_file.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/if_image_uploaded_add_views.dart';
import 'package:flutter/material.dart';

class IfImageNotUploadedListView extends StatelessWidget {
  const IfImageNotUploadedListView({
    super.key,
    required this.selectedFiles,
    required this.isFileUploaded,
  });

  final List<UploadedFile> selectedFiles;
  final bool isFileUploaded;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: selectedFiles.length,
        itemBuilder: (context, index) => IfImageUploadedAddViews(
          selectedFileName: selectedFiles[index].name,
          isFileUploaded: isFileUploaded,
        ),
      ),
    );
  }
}