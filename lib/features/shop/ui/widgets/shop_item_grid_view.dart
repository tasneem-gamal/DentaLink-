import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/item_container_patient_tool.dart';
import 'package:flutter/material.dart';

class ShopItemsGridView extends StatelessWidget {
  const ShopItemsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ), 
        itemCount: 10,
        itemBuilder: (context, index) => ItemContainerPatientTool(
          image: 'assets/images/patient.png', 
          imageWidth: 180,
          itemTitle: 'Cruette', 
          firstLabel: 'Price: ', 
          firstLabelText: '200', 
          secondLabel: 'Description: ', 
          secondLabelText: 'for deep cleaning',
          onTap: (){
            context.pushNamed(Routes.toolDetails);
          },
        )
      ),
    );
  }
}