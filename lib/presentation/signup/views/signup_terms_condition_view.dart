import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/signup/signup_controller.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_loader.dart';

class SignUpTermsConditionView extends StatelessWidget {
  static const String id = '/signUpTermsConditionView';

  const SignUpTermsConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SignUpController>(
          builder: (signUpController) {
            return Padding(
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
                      Strings.privacyPolicyText1,
                      style: robotoCondensedRegular.copyWith(
                        fontSize: 16,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      Strings.privacyPolicyText2,
                      style: robotoCondensedRegular.copyWith(
                        fontSize: 16,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      Strings.privacyPolicyText3,
                      style: robotoCondensedRegular.copyWith(
                        fontSize: 16,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 57),
                    signUpController.isLoading
                        ? const CustomLoadingButton(
                            text: 'Creating account...',
                          )
                        : PrimaryButton(
                            title: 'Next',
                            bgColor: AppColors.primaryColor,
                            onTap: () => signUpController.signUp(context),
                          ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
