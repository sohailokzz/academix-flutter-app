import 'package:acad/core/constants/app_strings.dart';
import 'package:acad/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        textTheme: AppTextStyles.textTheme,
      ),
      home: const HomeScreen(),
    );
  }
}
