import 'dart:io';

import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/auth/sign_up/data/models/uploaded_file.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/if_image_not_uploaded_list_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../if_image_not_uploaded_add_views.dart';

class UploadToolImages extends StatefulWidget {
  const UploadToolImages({
    super.key, required this.onFileUploaded, required this.onFileSelected,
  });

  final Function(bool) onFileUploaded;
  final Function(File?) onFileSelected;

  @override
  State<UploadToolImages> createState() => _UploadToolImages();
}

class _UploadToolImages extends State<UploadToolImages> {
  List<UploadedFile> selectedFiles = [];
  bool isFileUploaded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(Icons.upload_file_outlined),
            TitleOfTextField(title: 'Upload Images'),
          ],
        ),
        verticalSpace(12),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: ColorsManager.lightGreen,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorsManager.lightGray, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              children: [
                selectedFiles.isEmpty ?
                const IfImageNotUploadedAddViews() :
                IfImageNotUploadedListView(selectedFiles: selectedFiles, isFileUploaded: isFileUploaded),
                ElevatedButton(
                  onPressed: _pickFile, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff34FF9D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    'Choose File',
                    style: CustomTextStyles.font12BlackRegular(context),
                  )
                )
              ],
            ),
          ),
        )
      ],
    );
  }

Future<File> _saveFileToPermanentDirectory(PlatformFile platformFile) async {
  final directory = await getApplicationDocumentsDirectory(); 
  final newPath = "${directory.path}/${platformFile.name}";  
  final newFile = File(newPath);

  if (platformFile.path != null) {
    return File(platformFile.path!).copy(newPath); 
  } else if (platformFile.bytes != null) {
    return newFile.writeAsBytes(platformFile.bytes!);
  } else {
    throw Exception("Unable to save file: both bytes and path are null");
  }
}


Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null && result.files.isNotEmpty) {
      final platformFile = result.files.first;
      final savedFile = await _saveFileToPermanentDirectory(platformFile);

      _setNewFile(savedFile);
      await _simulateUpload();

      if (mounted) {
        _completeUpload();
      }
    }
  }


void _setNewFile(File file) {
  _removeFile();
  setState(() {
    selectedFiles = [
      UploadedFile(
        name: file.path.split('/').last,
        size: '${(file.lengthSync() / (1024 * 1024)).toStringAsFixed(2)} MB',
        type: file.path.split('.').last,
        isUploading: true,
      ),
    ];
  });

  widget.onFileSelected(file);  
}


  Future<void> _simulateUpload() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  void _completeUpload() {
    setState(() {
      if (selectedFiles.isNotEmpty) {
        selectedFiles.last.isUploading = false;
        isFileUploaded = true;
      }
    });

    widget.onFileUploaded(true);
  }
void _removeFile() {
  setState(() {
    selectedFiles.clear();
    isFileUploaded = false;
  });

  widget.onFileUploaded(false);
}

}

