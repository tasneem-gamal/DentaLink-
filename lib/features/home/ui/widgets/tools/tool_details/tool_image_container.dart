import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolImageContainer extends StatelessWidget {
  const ToolImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorsManager.moreLightGray),
            image: const DecorationImage(
              image: AssetImage('assets/images/tools.png'),
              fit: BoxFit.cover
            )
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.favorite_border, size: 32,)
          ),
        )
      ],
    );
  }
}