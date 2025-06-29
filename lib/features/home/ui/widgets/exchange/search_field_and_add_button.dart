import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/features/home/logic/add_exchange_tool/add_exchange_tool_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/bottom_sheet_add/add_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchFieldAndAddButton extends StatelessWidget {
  const SearchFieldAndAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 280.w,
          child: CustomTextFormField(
            validator: (validator) {},
            hintText: 'What are you looking for?',
            prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        ),
        horizontalSpace(5),
        SizedBox(
          width: 40.w,
          height: 50.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.mainBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  context: context,
                  builder: (bottomSheetContext) => BlocProvider.value(
                    value: BlocProvider.of<AddExchangeToolCubit>(context),
                    child: const AddBottomSheet(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
