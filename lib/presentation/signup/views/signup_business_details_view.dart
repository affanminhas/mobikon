import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/signup/signup_controller.dart';
import 'package:mobikon/presentation/signup/views/signup_terms_condition_view.dart';
import 'package:mobikon/presentation/signup/widgets/signup_stepper.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_dropdown.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class SignUpBusinessDetailsView extends StatelessWidget {
  static const String id = '/signUpBusinessDetailsView';

  const SignUpBusinessDetailsView({super.key});

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
                  const SignUpStepper(isBusinessInfo: true, isBasicInfoDone: true, isSecurityDone: true),
                  const SizedBox(height: 40),
                  Text(
                    'Business Details',
                    style: robotoCondensedBold.copyWith(fontSize: 25),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Should be accurate and all fields are mandatory',
                    style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          onChanged: (value) => signUpController.setBusinessName(value),
                          hintText: 'Business Name',
                          outlineColor: AppColors.lightGrey,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: CustomDropDown(
                            items: const ['Electronics', 'Fashion'],
                            hintText: 'Good Type',
                            onChanged: (value) => signUpController.setBusinessType(value),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => signUpController.setBusinessLocation(value),
                    hintText: 'Location',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => signUpController.setBusinessAddress(value),
                    hintText: 'Apt, Suite, or Unit',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const Spacer(),
                  Center(
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
                          onTap: signUpController.isBusinessFormValid
                              ? () {
                                  Navigator.pushNamed(context, SignUpTermsConditionView.id);
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
