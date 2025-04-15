import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/features/home/logic/search_cubit/search_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_history_item_list_view.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_history_title.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  context.pop();
                }, 
                icon: const Icon(
                  Icons.arrow_back_ios
                )
              ),
              Expanded(
                child: CustomTextFormField(
                  onChanged: (value){
                    //BlocProvider.of<SearchCubit>(context).search(value);
                  },
                  validator: (validator){}, 
                  hintText: 'What are you looking for?',
                  prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                ),
              ),
            ],
          ),
          verticalSpace(16),
          const SearchHistoryTitle(),
          verticalSpace(12),
        ],
      ),
    );
  }
}





