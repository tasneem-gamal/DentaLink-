import 'package:dentalink/features/on_boarding/logic/on_boarding_controller.dart';
import 'package:dentalink/features/on_boarding/widgets/on_boarding_next_button.dart';
import 'package:dentalink/features/on_boarding/widgets/on_boarding_page.dart';
import 'package:dentalink/features/on_boarding/widgets/on_boarding_smooth_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const[
            OnBoardingPage(
              title: "Struggling to find patients?\n We’ve got you covered!",
              subTitle: 'Turn your dental training into real-life success\n stories. with ',
              wordSubTitle: 'DENTALINK',
              alignment: Alignment.bottomLeft,
              image: 'assets/images/onboarding_1.png',
            ),
            OnBoardingPage(
              title: 'Buy, sell, or exchange dental tools, all in one convenient platform.',
              subTitle: 'Turn your dental training into real-life success\n stories. with ',
              wordSubTitle: 'DENTALINK',
              alignment: Alignment.center,
              image: 'assets/images/onboarding_2.png',
            ),
          ],
        ),
        const OnBoardingSmoothIndicator(),
        const OnBoardingNextButton()
      ],
    );
  }
}



