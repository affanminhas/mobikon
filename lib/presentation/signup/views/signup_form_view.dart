import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/login/views/login_view.dart';
import 'package:mobikon/presentation/signup/signup_controller.dart';
import 'package:mobikon/presentation/signup/views/signup_password_view.dart';
import 'package:mobikon/presentation/signup/widgets/signup_stepper.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class SignUpFormView extends StatelessWidget {
  static const String id = '/signUpFormView';

  const SignUpFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<SignUpController>(
          builder: (signUpController) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 36),
                  const SignUpStepper(isBasicInfo: true),
                  const SizedBox(height: 40),
                  Text(
                    'Tell Us About Yourself',
                    style: robotoCondensedBold.copyWith(fontSize: 25),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'This will be what shows on your profile',
                    style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    onChanged: (value) => signUpController.setFirstName(value),
                    hintText: 'First Name',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => signUpController.setLastName(value),
                    hintText: 'Last Name',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => signUpController.setEmail(value),
                    hintText: 'Email Address',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, LoginView.id),
                    child: Center(
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
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          title: 'Previous',
                          disabledColor: AppColors.lightGrey2,
                          disabledTextColor: AppColors.primaryColor.withOpacity(0.3),
                          textColor: AppColors.primaryColor,
                          textStyle: robotoCondensedBold.copyWith(fontSize: 16),
                          bgColor: AppColors.lightGrey2,
                          onTap: null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: PrimaryButton(
                          title: 'Next',
                          bgColor: AppColors.primaryColor,
                          disabledColor: AppColors.primaryColor50,
                          onTap: signUpController.firstName.isNotEmpty && signUpController.email.isNotEmpty
                              ? () {
                                  Navigator.pushNamed(context, SignUpPasswordView.id);
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 31),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
