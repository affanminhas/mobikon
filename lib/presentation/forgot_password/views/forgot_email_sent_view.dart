import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/welcome/welcome_view.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class ForgotPassEmailSentView extends StatelessWidget {
  static const id = '/forgot-password/email-sent';

  const ForgotPassEmailSentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 36),
                Image.asset(Strings.verifiedLogo, width: 100, height: 100),
                const SizedBox(height: 32),
                Text(
                  'Successfully Sent Link',
                  style: robotoCondensedBold.copyWith(fontSize: 25),
                ),
                const SizedBox(height: 4),
                Text(
                  'Password reset link has been sent to bru*****n@gmail.com please check your email and follow the instructions',
                  style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                PrimaryButton(
                  title: 'Done',
                  bgColor: AppColors.primaryColor,
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, WelcomeView.id, (route) => false),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
