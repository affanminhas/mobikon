import 'package:flutter/material.dart';
import 'package:mobikon/views/login/login_view.dart';
import 'package:mobikon/views/signup/verify_code_view.dart';
import 'package:mobikon/views/signup/verify_email_view.dart';
import 'package:mobikon/views/welcome/welcome_view.dart';

import 'views/splash/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.id:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case LoginView.id:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case WelcomeView.id:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case VerifyEmailView.id:
        return MaterialPageRoute(builder: (_) => const VerifyEmailView());
      case VerifyCodeView.id:
        return MaterialPageRoute(builder: (_) => const VerifyCodeView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error"),
          ),
        );
      },
    );
  }
}
