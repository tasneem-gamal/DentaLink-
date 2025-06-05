import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:dentalink/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/tool_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToolDetailsView extends StatelessWidget {
  const ToolDetailsView({super.key, required this.toolData});
  final ToolData toolData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralCustomAppBar(title: 'Tool details'),
      body: ToolDetailsViewBody(
        toolData: toolData,
      ),
      bottomNavigationBar: Padding(
        padding: Constants.appPadding,
        child: CustomAppButton(
          btnText: 'Add to cart',
          onPressed: () {
            print('Sending toolId: ${toolData.id}');
            context.read<AddToCartCubit>().emitAddToCartStates([
              Tool(toolId: toolData.id, quantity: 1),
            ]);
          },
        ),
      ),
    );
  }
}
