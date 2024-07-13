import 'package:acad/core/constants/colors.dart';
import 'package:acad/core/constants/on_boarding_data.dart';
import 'package:acad/core/constants/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/onboarding_design.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            pagination: _currentIndex != 4
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
                child: _currentIndex == 4
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              width: 212,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(5), // <-- Radius
                                  ),
                                ),
                                child: Text(
                                  'Sign In',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          kWidth(16),
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              width: 212,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 10),
                        child: SizedBox(
                          height: 54,
                          width: 212,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_currentIndex != 4) {
                                _controller.next();
                              } else {}
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              ),
                            ),
                            child: Text(
                              'Continue',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
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
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.btnBackGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
