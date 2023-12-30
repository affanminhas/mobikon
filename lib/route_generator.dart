import 'package:flutter/material.dart';
import 'package:mobikon/presentation/dashboard/dashboard_view.dart';
import 'package:mobikon/presentation/forgot_password/views/forgot_email_sent_view.dart';
import 'package:mobikon/presentation/forgot_password/views/forgot_password_view.dart';
import 'package:mobikon/presentation/app_views/approval_view.dart';
import 'package:mobikon/presentation/home/views/container/container_detaill_view.dart';
import 'package:mobikon/presentation/home/views/container/container_livefeed_view.dart';
import 'package:mobikon/presentation/home/views/container/request_container_view.dart';
import 'package:mobikon/presentation/home/views/container/request_submit_view.dart';
import 'package:mobikon/presentation/home/views/container/slide_door_feed_view.dart';
import 'package:mobikon/presentation/home/views/container/track_container_view.dart';
import 'package:mobikon/presentation/login/views/login_view.dart';
import 'package:mobikon/presentation/my_account/views/business_details_view.dart';
import 'package:mobikon/presentation/my_account/views/notification_view.dart';
import 'package:mobikon/presentation/my_account/views/personal_info_view.dart';
import 'package:mobikon/presentation/my_account/views/security_view.dart';
import 'package:mobikon/presentation/my_account/views/staff_member/edit_staff_member.dart';
import 'package:mobikon/presentation/my_account/views/staff_member/staff_member_detail_view.dart';
import 'package:mobikon/presentation/my_account/views/staff_member/staff_members_view.dart';
import 'package:mobikon/presentation/products/views/add_new_product_view.dart';
import 'package:mobikon/presentation/products/views/image_preview.dart';
import 'package:mobikon/presentation/signup/views/business_form_view.dart';
import 'package:mobikon/presentation/signup/views/business_success_view.dart';
import 'package:mobikon/presentation/signup/views/signup_completed_view.dart';
import 'package:mobikon/presentation/signup/views/signup_form_view.dart';
import 'package:mobikon/presentation/signup/views/signup_password_view.dart';
import 'package:mobikon/presentation/signup/views/signup_terms_condition_view.dart';
import 'package:mobikon/presentation/signup/views/verify_code_view.dart';
import 'package:mobikon/presentation/signup/views/verify_email_view.dart';
import 'package:mobikon/presentation/splash/splash_view.dart';
import 'package:mobikon/presentation/splash/validating_view.dart';
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
        return PageTransition(
          child: const SignUpFormView(),
          type: PageTransitionType.rightToLeft,
        );
      case SignUpPasswordView.id:
        return PageTransition(child: const SignUpPasswordView(), type: PageTransitionType.rightToLeft);
      case BusinessFormView.id:
        return PageTransition(child: const BusinessFormView(), type: PageTransitionType.rightToLeft);
      case SignUpTermsConditionView.id:
        return PageTransition(child: const SignUpTermsConditionView(), type: PageTransitionType.rightToLeft);
      case SignUpCompletedView.id:
        return PageTransition(child: const SignUpCompletedView(), type: PageTransitionType.rightToLeft);
      case ApprovalView.id:
        return PageTransition(child: const ApprovalView(), type: PageTransitionType.rightToLeft);
      case ForgotPasswordView.id:
        return PageTransition(child: const ForgotPasswordView(), type: PageTransitionType.rightToLeft);
      case ForgotPassEmailSentView.id:
        return PageTransition(child: const ForgotPassEmailSentView(), type: PageTransitionType.rightToLeft);
      case BusinessSuccessView.id:
        return PageTransition(child: const BusinessSuccessView(), type: PageTransitionType.rightToLeft);
      case ValidatingView.id:
        return PageTransition(child: const ValidatingView(), type: PageTransitionType.rightToLeft);
      case DashboardView.id:
        return PageTransition(child: const DashboardView(), type: PageTransitionType.rightToLeft);
      case ContainerDetailView.id:
        return PageTransition(child: const ContainerDetailView(), type: PageTransitionType.rightToLeft);
      case AddNewProductView.id:
        return PageTransition(child: const AddNewProductView(), type: PageTransitionType.rightToLeft);
      case PersonalInfoView.id:
        return PageTransition(child: const PersonalInfoView(), type: PageTransitionType.rightToLeft);
      case BusinessDetailsView.id:
        return PageTransition(child: const BusinessDetailsView(), type: PageTransitionType.rightToLeft);
      case StaffMembersView.id:
        return PageTransition(child: const StaffMembersView(), type: PageTransitionType.rightToLeft);
      case StaffMemberDetailView.id:
        return PageTransition(child: const StaffMemberDetailView(), type: PageTransitionType.rightToLeft);
      case SecurityView.id:
        return PageTransition(child: const SecurityView(), type: PageTransitionType.rightToLeft);
      case NotificationView.id:
        return PageTransition(child: const NotificationView(), type: PageTransitionType.rightToLeft);
      case RequestContainerView.id:
        return PageTransition(child: const RequestContainerView(), type: PageTransitionType.rightToLeft);
      case RequestSubmittedView.id:
        return PageTransition(child: const RequestSubmittedView(), type: PageTransitionType.rightToLeft);
      case EditStaffMember.id:
        return PageTransition(child: const EditStaffMember(), type: PageTransitionType.rightToLeft);
      case ContainerLiveFeedView.id:
        return PageTransition(child: const ContainerLiveFeedView(), type: PageTransitionType.rightToLeft);
      case SlideDoorFeedView.id:
        return PageTransition(child: const SlideDoorFeedView(), type: PageTransitionType.rightToLeft);
      case TrackContainerView.id:
        return PageTransition(child: const TrackContainerView(), type: PageTransitionType.rightToLeft);
      case ImagePreview.id:
        ImagePreviewArguments args = settings.arguments as ImagePreviewArguments;
        return PageTransition(child: ImagePreview(image: args.image), type: PageTransitionType.rightToLeft);
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
