import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/widgets/item_container_patient_tool.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/routing/routes.dart';

class SpecificShopGridView extends StatelessWidget {
  const SpecificShopGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) => ItemContainerPatientTool(
        image: 'assets/images/tools.png',
        imageWidth: 180,
        itemTitle: 'Curette',
        firstLabel: 'Price: ',
        firstLabelText: '200',
        secondLabel: 'Description: ',
        secondLabelText: 'for deep cleaning bla bkla',
        onTap: () {
          context.pushNamed(Routes.toolDetails);
        },
      ),
      itemCount: 2,
    ));
  }
}