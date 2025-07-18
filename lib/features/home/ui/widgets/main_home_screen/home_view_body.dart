import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/app_categories.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/latest_patients_bloc_builder.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/new_in_tools_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(16)),
          SliverToBoxAdapter(
            child: CustomTextFormField(
              readOnly: true,
              onTap: () {
                context.pushNamed(Routes.searchView);
              },
              validator: (value) => null,
              hintText: 'What are you looking for?',
              prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(24)),
          const SliverToBoxAdapter(child: AppCategories()),
          SliverToBoxAdapter(child: verticalSpace(30)),
          SliverToBoxAdapter(
            child: Text(
              'New In Tools',
              style: CustomTextStyles.font16BlackMedium(context),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(child: NewInToolsBlocBuilder()),
          SliverToBoxAdapter(child: verticalSpace(24)),
          SliverToBoxAdapter(
            child: Text(
              'Latest Cases',
              style: CustomTextStyles.font16BlackMedium(context),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(child: LatestPatientsBlocBuilder()),
        ],
      ),
    );
  }
}
