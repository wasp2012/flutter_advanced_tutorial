import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/routing/routes.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/login_screen.dart';
import 'package:flutter_advanced_tutorial/feature/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
