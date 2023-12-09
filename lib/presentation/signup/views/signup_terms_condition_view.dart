import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/signup/views/signup_completed_view.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class SignUpTermsConditionView extends StatelessWidget {
  static const String id = '/signUpTermsConditionView';

  const SignUpTermsConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 36),
                Text(
                  'Accept Terms & Conditions',
                  style: robotoCondensedBold.copyWith(fontSize: 25),
                ),
                const SizedBox(height: 4),
                Text(
                  'By tapping i AGREE, Your agree to the terms & Conditions provided by IRT',
                  style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                ),
                const SizedBox(height: 40),
                Text(
                  Strings.termsAndCondition,
                  textAlign: TextAlign.justify,
                  style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                ),
                PrimaryButton(
                  title: 'Next',
                  bgColor: AppColors.primaryColor,
                  onTap: () => Navigator.pushNamed(context, SignUpCompletedView.id),
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
