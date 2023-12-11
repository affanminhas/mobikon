import 'package:flutter/material.dart';
import 'package:mobikon/presentation/forgot_password/views/forgot_email_sent_view.dart';
import 'package:mobikon/presentation/forgot_password/views/forgot_password_view.dart';
import 'package:mobikon/presentation/login/views/login_approval_view.dart';
import 'package:mobikon/presentation/login/views/login_view.dart';
import 'package:mobikon/presentation/signup/views/signup_business_details_view.dart';
import 'package:mobikon/presentation/signup/views/signup_completed_view.dart';
import 'package:mobikon/presentation/signup/views/signup_form_view.dart';
import 'package:mobikon/presentation/signup/views/signup_password_view.dart';
import 'package:mobikon/presentation/signup/views/signup_terms_condition_view.dart';
import 'package:mobikon/presentation/signup/views/verify_code_view.dart';
import 'package:mobikon/presentation/signup/views/verify_email_view.dart';
import 'package:mobikon/presentation/splash/splash_view.dart';
import 'package:mobikon/presentation/welcome/welcome_view.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.id:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case LoginView.id:
        return PageTransition(child: const LoginView(), type: PageTransitionType.rightToLeft);
      case WelcomeView.id:
        return PageTransition(child: const WelcomeView(), type: PageTransitionType.rightToLeft);
      case VerifyEmailView.id:
        return PageTransition(child: const VerifyEmailView(), type: PageTransitionType.rightToLeft);
      case VerifyCodeView.id:
        return PageTransition(child: const VerifyCodeView(), type: PageTransitionType.rightToLeft);
      case SignUpFormView.id:
        return PageTransition(child: const SignUpFormView(), type: PageTransitionType.rightToLeft);
      case SignUpPasswordView.id:
        return PageTransition(child: const SignUpPasswordView(), type: PageTransitionType.rightToLeft);
      case SignUpBusinessDetailsView.id:
        return PageTransition(child: const SignUpBusinessDetailsView(), type: PageTransitionType.rightToLeft);
      case SignUpTermsConditionView.id:
        return PageTransition(child: const SignUpTermsConditionView(), type: PageTransitionType.rightToLeft);
      case SignUpCompletedView.id:
        return PageTransition(child: const SignUpCompletedView(), type: PageTransitionType.rightToLeft);
      case LoginApprovalView.id:
        return PageTransition(child: const LoginApprovalView(), type: PageTransitionType.rightToLeft);
      case ForgotPasswordView.id:
        return PageTransition(child: const ForgotPasswordView(), type: PageTransitionType.rightToLeft);
      case ForgotPassEmailSentView.id:
        return PageTransition(child: const ForgotPassEmailSentView(), type: PageTransitionType.rightToLeft);
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
