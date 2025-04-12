import 'dart:io';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/auth/sign_up/data/models/uploaded_file.dart';
import 'package:dentalink/features/auth/sign_up/logic/sign_cubit/sign_cubit.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/if_image_not_uploaded.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/if_image_uploaded.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

class UploadTitleAndContainer extends StatefulWidget {
  const UploadTitleAndContainer({
    super.key,
    required this.onFileUploaded,
    required this.onFileSelected,
  });

  final Function(bool) onFileUploaded;
  final Function(File?) onFileSelected;

  @override
  State<UploadTitleAndContainer> createState() =>
      _UploadTitleAndContainerState();
}

class _UploadTitleAndContainerState extends State<UploadTitleAndContainer> {
  List<UploadedFile> selectedFiles = [];
  bool isFileUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(Icons.upload_file_outlined),
            TitleOfTextField(title: 'Upload Your Student ID'),
          ],
        ),
        verticalSpace(14),
        Container(
          height: 80,
          decoration: _decoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedFiles.isEmpty
                    ? const IfImageNotUploaded()
                    : IfImageUploaded(
                        selectedFileName: selectedFiles.first.name,
                        isFileUploaded: isFileUploaded,
                      ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff34FF9D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: _pickFile,
                  child: Text(
                    'Choose file',
                    style: CustomTextStyles.font12BlackRegular(context),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: ColorsManager.lightGreen,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: ColorsManager.lightGray, width: 1),
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
  context.read<SignCubit>().imageFile = file;
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
