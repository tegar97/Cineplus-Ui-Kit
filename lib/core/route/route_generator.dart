
import 'package:cineplus/ui/pages/home/home_screen.dart';
import 'package:cineplus/ui/pages/onboarding_screen/onboarding_screen.dart';
import 'package:cineplus/ui/pages/splash_screen/splash_screen.dart';
import 'package:cineplus/ui/pages/user_profile/avatar_select_screen.dart';
import 'package:flutter/material.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print(settings.name);

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/avatar-selection':
        return MaterialPageRoute(builder: (_) => const AvatarSelectScreen());
      case '/onboarding_screen':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('error'),
        ),
        body: const Center(
          child: const Text('Erorr'),
        ),
      );
    });
  }
}
