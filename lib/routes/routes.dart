import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/screens/home_screen.dart';
import 'routes_names.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.splashscreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashScreen(),
      //   );

      /// Main Screen
      case RoutesName.homepage:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return CupertinoPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route Found'),
            ),
          ),
        );
    }
  }
}
