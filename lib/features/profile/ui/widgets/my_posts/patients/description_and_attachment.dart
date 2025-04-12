import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/delete_alert_dialog.dart';
import 'package:flutter/material.dart';

class DescriptionAndAttachment extends StatelessWidget {
  const DescriptionAndAttachment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LabelTextApp(label: 'Description: ', text: 'Used to adjust braces, wires, and other orthodontic appliances.'),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Attachments',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            Container(
              width: 134,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.moreLightGray),
                borderRadius: BorderRadius.circular(12)
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.image_outlined),
                  Text('data.png'),
                  Icon(Icons.close)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                showDialog(
                  context: context, 
                  builder: (context) => const DeleteAlertDialog()
                );
              },
              child: const Icon(Icons.delete, color: Colors.red,)
            )
          ],
        )
      ],
    );
  }
}
