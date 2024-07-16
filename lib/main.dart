import 'package:acad/core/constants/app_strings.dart';
import 'package:acad/providers/on_boarding_provider.dart';
import 'package:acad/ui/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/colors.dart';
import 'core/constants/text_styles.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnBoardingProvider(),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appTitle,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          useMaterial3: true,
          textTheme: AppTextStyles.textTheme,
        ),
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
      ),
    );
  }
}
