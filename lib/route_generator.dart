import 'package:flutter/material.dart';
import 'package:mobikon/presentation/login/login_view.dart';
import 'package:mobikon/presentation/signup/views/signup_business_details_view.dart';
import 'package:mobikon/presentation/signup/views/signup_completed_view.dart';
import 'package:mobikon/presentation/signup/views/signup_form_view.dart';
import 'package:mobikon/presentation/signup/views/signup_password_view.dart';
import 'package:mobikon/presentation/signup/views/signup_terms_condition_view.dart';
import 'package:mobikon/presentation/signup/views/verify_code_view.dart';
import 'package:mobikon/presentation/signup/views/verify_email_view.dart';
import 'package:mobikon/presentation/splash/splash_view.dart';
import 'package:mobikon/presentation/welcome/welcome_view.dart';

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
      case SignUpFormView.id:
        return MaterialPageRoute(builder: (_) => const SignUpFormView());
      case SignUpPasswordView.id:
        return MaterialPageRoute(builder: (_) => const SignUpPasswordView());
      case SignUpBusinessDetailsView.id:
        return MaterialPageRoute(builder: (_) => const SignUpBusinessDetailsView());
      case SignUpTermsConditionView.id:
        return MaterialPageRoute(builder: (_) => const SignUpTermsConditionView());
      case SignUpCompletedView.id:
        return MaterialPageRoute(builder: (_) => const SignUpCompletedView());
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
