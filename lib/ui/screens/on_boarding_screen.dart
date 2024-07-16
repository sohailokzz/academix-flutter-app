import 'package:acad/providers/on_boarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/on_boarding_data.dart';
import '../../core/constants/screen_utils.dart';
import '../widgets/default_button.dart';
import '../widgets/onboarding_design.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnBoardingProvider>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
            index: onboardingProvider.currentIndex,
            onIndexChanged: (index) {
              onboardingProvider.setCurrentIndex(index);
            },
            pagination: onboardingProvider.currentIndex != 4
                ? const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(
                      bottom: 110,
                    ),
                    builder: DotSwiperPaginationBuilder(
                      activeColor: AppColors.primaryColor,
                      color: AppColors.btnBackGreyColor,
                    ),
                  )
                : null,
            controller: onboardingProvider.swiperConroller,
            itemCount: 5,
            itemBuilder: (context, index) {
              return OnboardingDesign(
                title: titles[index],
                subtitle: subtitles[index],
                imageUrl: introImagePath[index],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              bottom: 32,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                child: onboardingProvider.currentIndex == 4
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: DefaultButton(
                              onPress: () {},
                              height: 48,
                              width: 212,
                              title: 'Sign In',
                            ),
                          ),
                          kWidth(16),
                          Expanded(
                            child: DefaultButton(
                              onPress: () {},
                              height: 48,
                              width: 212,
                              buttonColor: Colors.white,
                              textColor: AppColors.primaryColor,
                              title: 'Sign Up',
                            ),
                          ),
                        ],
                      )
                    : DefaultButton(
                        onPress: () {
                          onboardingProvider.next();
                        },
                        height: 54,
                        width: 212,
                        title: 'Continue',
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 40,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: DefaultButton(
                onPress: () {},
                title: 'Skip',
                height: 36,
                width: 70,
                buttonColor: AppColors.btnBackGreyColor,
                textColor: Colors.black,
                outlineBorder: false,
                textSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
