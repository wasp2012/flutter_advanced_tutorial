import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/di/dependancy_injection.dart';
import 'package:flutter_advanced_tutorial/core/routing/routes.dart';
import 'package:flutter_advanced_tutorial/feature/home/ui/home_screen.dart';
import 'package:flutter_advanced_tutorial/feature/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/login_screen.dart';
import 'package:flutter_advanced_tutorial/feature/onboarding/onboarding_screen.dart';
import 'package:flutter_advanced_tutorial/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter_advanced_tutorial/feature/sign_up/ui/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
         case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
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
