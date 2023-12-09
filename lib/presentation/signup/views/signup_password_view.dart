import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/login/views/login_view.dart';
import 'package:mobikon/presentation/signup/signup_controller.dart';
import 'package:mobikon/presentation/signup/views/signup_business_details_view.dart';
import 'package:mobikon/presentation/signup/widgets/signup_stepper.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class SignUpPasswordView extends StatefulWidget {
  static const String id = '/signUpPasswordView';

  const SignUpPasswordView({super.key});

  @override
  State<SignUpPasswordView> createState() => _SignUpPasswordViewState();
}

class _SignUpPasswordViewState extends State<SignUpPasswordView> {
  bool isPasswordVisible = false;

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
                  const SignUpStepper(isSecurity: true, isBasicInfoDone: true),
                  const SizedBox(height: 40),
                  Text(
                    'Create Password',
                    style: robotoCondensedBold.copyWith(fontSize: 25),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'This should be 8 characters long and unique',
                    style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    suffixIcon: isPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye,
                    isSuffixIcon: true,
                    isPassword: !isPasswordVisible,
                    onSuffixIconPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    onChanged: (value) => signUpController.setPassword(value),
                    hintText: 'Password',
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
                          textColor: AppColors.primaryColor,
                          textStyle: robotoCondensedBold.copyWith(fontSize: 16),
                          bgColor: AppColors.lightGrey2,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: PrimaryButton(
                          title: 'Next',
                          bgColor: AppColors.primaryColor,
                          disabledColor: AppColors.primaryColor50,
                          onTap: signUpController.password.isNotEmpty
                              ? () {
                                  Navigator.pushNamed(context, SignUpBusinessDetailsView.id);
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
