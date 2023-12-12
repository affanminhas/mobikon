import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/forgot_password/forgot_password_controller.dart';
import 'package:mobikon/presentation/forgot_password/views/forgot_email_sent_view.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String id = '/forgot-password';

  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<ForgotPasswordController>(
            builder: (forgotPasswordController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 36),
                  Image.asset(Strings.forgotPasswordLogo, width: 70, height: 70),
                  const SizedBox(height: 24),
                  Text(
                    'Reset Password',
                    style: robotoCondensedBold.copyWith(fontSize: 25),
                  ),
                  Text(
                    'Please enter your registered email address to get the password reset link',
                    style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    onChanged: (value) => forgotPasswordController.setEmail(value),
                    hintText: 'Email Address',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account? ',
                                style: robotoCondensedRegular.copyWith(
                                  fontSize: 14,
                                  color: AppColors.darkGrey,
                                  height: 1.7,
                                ),
                              ),
                              TextSpan(
                                text: 'Login',
                                style: robotoCondensedMedium.copyWith(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  height: 1.7,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      PrimaryButton(
                        title: 'Get Reset Link',
                        bgColor: AppColors.primaryColor,
                        disabledColor: AppColors.primaryColor50,
                        onTap: forgotPasswordController.isFormValid
                            ? () {
                                Navigator.pushNamed(context, ForgotPassEmailSentView.id);
                              }
                            : null,
                      ),
                      const SizedBox(height: 31),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
