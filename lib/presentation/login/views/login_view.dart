import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/presentation/forgot_password/views/forgot_password_view.dart';
import 'package:mobikon/presentation/login/login_controller.dart';
import 'package:mobikon/presentation/login/views/login_approval_view.dart';
import 'package:mobikon/presentation/signup/views/verify_email_view.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

import '../../../constants/typography.dart';

class LoginView extends StatefulWidget {
  static const String id = 'login_view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<LoginController>(
            builder: (loginController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 36),
                  Image.asset(Strings.loginLogo, width: 70, height: 70),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome Back',
                    style: robotoCondensedBold.copyWith(fontSize: 25),
                  ),
                  Text(
                    'Please enter your login credentials to continue to app',
                    style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    onChanged: (value) => loginController.setEmail(value),
                    hintText: 'Email Address',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    suffixIcon: isPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye,
                    isSuffixIcon: true,
                    isPassword: !isPasswordVisible,
                    onSuffixIconPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    onChanged: (value) => loginController.setPassword(value),
                    hintText: 'Password',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, ForgotPasswordView.id),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: robotoCondensedMedium.copyWith(fontSize: 16, color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, VerifyEmailView.id),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don’t have an account? ',
                                style: robotoCondensedRegular.copyWith(
                                  fontSize: 14,
                                  color: AppColors.darkGrey,
                                  height: 1.7,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign up',
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
                        title: 'Login',
                        bgColor: AppColors.primaryColor,
                        disabledColor: AppColors.primaryColor50,
                        onTap: loginController.isLoginFormValid
                            ? () {
                                Navigator.pushNamed(context, LoginApprovalView.id);
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
