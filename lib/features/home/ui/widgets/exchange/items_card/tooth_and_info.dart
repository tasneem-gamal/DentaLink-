import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:flutter/material.dart';

class ToothAndInfo extends StatelessWidget {
  const ToothAndInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/exchange_tooth.png'),
        horizontalSpace(16),
        const Expanded(
          child: Column(
            children: [
              LabelTextApp(
                label: 'Publisher: ', 
                text: 'Dr Mahmoud'
              ),
              LabelTextApp(
                label: 'Name: ', 
                text: 'Canines'
              ),
              LabelTextApp(
                label: 'Exchange with: ', 
                text: 'secound molar'
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.favorite_border, size: 32,)
        )
      ],
    );
  }
}
