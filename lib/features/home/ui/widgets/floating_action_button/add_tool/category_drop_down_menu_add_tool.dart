import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class CategoryDropDownMenuAddTool extends StatefulWidget {
  const CategoryDropDownMenuAddTool({
    super.key, required this.selectedValue,
  });
  final ValueNotifier<String?> selectedValue;

  @override
  State<CategoryDropDownMenuAddTool> createState() => _CategoryDropDownMenuAddTool();
}

class _CategoryDropDownMenuAddTool extends State<CategoryDropDownMenuAddTool> {

  final List<String> items = [
    'Diagnostic Tools',
    'Hand Instruments',
    'Restorative Instruments',
    'Extraction Tools',
    'Endodontic Instruments',
    'Orthodontic Tools',
    'Surgical Instruments',
    'Periodontal Tools',
    'Prosthodontic Instruments',
    'Sterilization & Hygiene'
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: widget.selectedValue,
      builder: (context, value, child) {
        return DropdownButtonFormField<String>(
          validator: categoryValidate,
          value: value,
          decoration: categoryDecoration(),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: CustomTextStyles.font12BlackMedium(context),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            widget.selectedValue.value = newValue;
          },
        );
      },
    );
  }

  InputDecoration categoryDecoration() {
    return InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: ColorsManager.moreLightGray)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: ColorsManager.moreLightGray)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: ColorsManager.moreLightGray)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red)),
        );
  }

  String? categoryValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Category cannot be empty';
    }
    return null;
  }
}
