import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/change_image.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/patients/description_and_attachment.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/patients/edit_patient_post_bottom_sheet.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/patients/patient_text_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientPostItem extends StatelessWidget {
  const PatientPostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.moreLightGray)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                ChangeImage(
                  image: 'assets/images/doctor_icon.png',
                  width: 80.w,
                  height: 180.h,
                ),
                horizontalSpace(20),
                const PatientTextInfo(),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      isScrollControlled: true,
                      context: context, 
                      builder: (context) => const EditPatientPostBottomSheet()
                    );
                  },
                  child: const Icon(
                  Icons.edit_square, 
                  color: ColorsManager.mainBlue,
                  ),
                )
              ],
            ),
            verticalSpace(12),
            const DescriptionAndAttachment()
          ],
        ),
      ),
    );
  }
}






