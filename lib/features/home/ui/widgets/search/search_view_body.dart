import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/features/home/logic/search_cubit/search_cubit.dart';
import 'package:dentalink/features/home/logic/search_history_cubit/search_history_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_bloc_builder.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String searchText = '';

  @override
  void initState() {
    super.initState();
    context.read<SearchHistoryCubit>().loadHistory();
  }

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
                  onFieldSubmitted: (value){
                    setState(() {
                      searchText = value;
                    });
                    BlocProvider.of<SearchCubit>(context).search(value);
                    if (value.trim().isNotEmpty) {
                      saveSearchTerm(value.trim());
                    }
                  },
                  validator: (validator){}, 
                  hintText: 'What are you looking for?',
                  prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                ),
              ),
            ],
          ),
          verticalSpace(16),
          searchText.trim().isEmpty 
          ? const SearchHistory()
          : const  SearchBlocBuilder()
        ],
      ),
    );
  }

  void saveSearchTerm(String term) {
  if (term.trim().isNotEmpty) {
    context.read<SearchHistoryCubit>().addSearchTerm(term.trim());
  }
}
}





