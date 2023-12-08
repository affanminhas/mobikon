import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/views/signup/verify_code_view.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class VerifyEmailView extends StatefulWidget {
  static const String id = 'verify_email_view';

  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              Text(
                'Verify Your Email',
                style: robotoCondensedBold.copyWith(fontSize: 25),
              ),
              Text(
                'Please enter the email to get OTP code to get started',
                style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
              ),
              const SizedBox(height: 24),
              CustomTextField(
                onChanged: (value) => setState(() => _email = value),
                hintText: 'Email Address',
                outlineColor: AppColors.lightGrey,
              ),
              const Spacer(),
              Column(
                children: [
                  const SizedBox(height: 16),
                  RichText(
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
                  const SizedBox(height: 16),
                  PrimaryButton(
                    title: 'Next',
                    bgColor: AppColors.primaryColor,
                    onTap: _email.isEmpty
                        ? null
                        : () {
                            Navigator.pushNamed(context, VerifyCodeView.id);
                          },
                  ),
                  const SizedBox(height: 31),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
