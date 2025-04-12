import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/features/profile/ui/widgets/doctor_avatar.dart';
import 'package:dentalink/features/profile/ui/widgets/profile_option_item.dart';
import 'package:dentalink/features/profile/ui/widgets/sign_out.dart';
import 'package:dentalink/features/profile/ui/widgets/sign_out_bloc_listner.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        children: [
          const DoctorAvatar(),
          verticalSpace(30),
          ProfileOptionItem(
            icon: Image.asset('assets/images/my_posts_pin.png'),
            title: 'My Posts',
            onTap: (){
              context.pushNamed(Routes.myPostsView);
            }
          ),
          ProfileOptionItem(
            icon: const Icon(Icons.shopping_bag_outlined, size: 26,),
            title: 'All orders',
            onTap: (){
              context.pushNamed(Routes.allOrdersView);
            }
          ),
          ProfileOptionItem(
            icon: const Icon(Icons.info_outline, size: 26,),
            title: 'About Us',
            onTap: (){
              context.pushNamed(Routes.aboutUsView);
            }
          ),
          ProfileOptionItem(
            icon: const Icon(Icons.verified_user_outlined, size: 26,),
            title: 'Privacy Policy',
            onTap: (){
              context.pushNamed(Routes.privacyPolicyView);
            }
          ),
          ProfileOptionItem(
            icon: Image.asset('assets/images/terms_conditions_icon.png'),
            title: 'Terms & Conditions',
            onTap: (){
              context.pushNamed(Routes.termsAndConditionsView);
            }
          ),
          const SignOut(),
          const SignOutBlocListner()
        ],
      ),
    );
  }
}



