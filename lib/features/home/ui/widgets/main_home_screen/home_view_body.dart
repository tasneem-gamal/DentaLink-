import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/app_categories.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/latest_patients_bloc_builder.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/new_in_tools_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            CustomTextFormField(
              readOnly: true,
              onTap: (){
                context.pushNamed(Routes.searchView);
              },
              validator: (value) {
                return null;
              },
              hintText: 'What are you looking for?',
              prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
            ),
            verticalSpace(24),
            const AppCategories(),
            verticalSpace(30),
            Text(
              'New In Tools',
              style: CustomTextStyles.font16BlackMedium(context),
            ),
            verticalSpace(10),
            const NewInToolsListView(),
            verticalSpace(24),
            Text(
              'Latest Cases',
              style: CustomTextStyles.font16BlackMedium(context),
            ),
            verticalSpace(10),
            const LatestPatientsBlocBuilder()
          ],
        ),
      ),
    );
  }
}









