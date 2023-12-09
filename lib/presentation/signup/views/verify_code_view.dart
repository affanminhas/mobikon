import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/signup/views/signup_form_view.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeView extends StatefulWidget {
  static const String id = 'verify_code_view';

  const VerifyCodeView({super.key});

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  String _pin = '';

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.lightGrey),
      borderRadius: BorderRadius.circular(5),
    ),
  );

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
              Image.asset(Strings.emailLogo, height: 70, width: 70),
              const SizedBox(height: 24),
              Text(
                'Enter The Code We Emailed You',
                style: robotoCondensedBold.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 4),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'You’ll receive an OTP on the ',
                      style: robotoCondensedRegular.copyWith(
                        fontSize: 14,
                        color: AppColors.darkGrey,
                        height: 1.7,
                      ),
                    ),
                    TextSpan(
                      text: 'maaz@demomail.com',
                      style: robotoCondensedMedium.copyWith(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: AppColors.primaryColor),
                ),
                submittedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: AppColors.primaryColor),
                ),
                onChanged: (pin) => setState(() => _pin = pin),
              ),
              const SizedBox(height: 24),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Did’nt receive the code yet? ',
                        style: robotoCondensedRegular.copyWith(
                          fontSize: 14,
                          color: AppColors.darkGrey,
                          height: 1.7,
                        ),
                      ),
                      TextSpan(
                        text: 'Resend Code Again',
                        style: robotoCondensedMedium.copyWith(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          height: 1.7,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Verify Code',
                bgColor: AppColors.primaryColor,
                onTap: _pin.length < 6
                    ? null
                    : () {
                        Navigator.pushNamed(context, SignUpFormView.id);
                      },
              ),
              const SizedBox(height: 31),
            ],
          ),
        ),
      ),
    );
  }
}
