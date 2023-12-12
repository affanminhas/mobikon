import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/login/views/login_view.dart';
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
                            hintText: 'Business Type',
                            onChanged: (value) => signUpController.setBusinessType(value),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => signUpController.setBusinessLocation(value),
                    hintText: 'Business Location',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => signUpController.setBusinessAddress(value),
                    hintText: 'Tax Number',
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Container Preferences',
                    style: robotoCondensedRegular.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        context: context,
                        //isScrollControlled: true,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(height: 16),
                                Center(
                                  child: Container(
                                    width: 90,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: AppColors.lightGrey,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'Select Container Size',
                                  style: robotoCondensedBold.copyWith(fontSize: 18),
                                ),
                                Text(
                                  'You can select one from below',
                                  style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
                                ),
                                Expanded(
                                  child: ListWheelScrollView.useDelegate(
                                    itemExtent: 50,
                                    diameterRatio: 1.8,
                                    useMagnifier: true,
                                    magnification: 1.2,
                                    perspective: 0.01,
                                    physics: const FixedExtentScrollPhysics(),
                                    onSelectedItemChanged: (index) {
                                      signUpController.setSelectedContainerSize('${index + 1}0 Foot');
                                    },
                                    childDelegate: ListWheelChildBuilderDelegate(
                                      builder: (context, index) => Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${index + 1}0 Foot',
                                          style: robotoCondensedRegular.copyWith(fontSize: 15),
                                        ),
                                      ),
                                      childCount: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.lightGrey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            signUpController.selectedContainerSize.isEmpty
                                ? 'Container Size'
                                : signUpController.selectedContainerSize,
                            style: robotoCondensedRegular.copyWith(fontSize: 15),
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Camera Required For Container?',
                    style: robotoCondensedRegular.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: Row(
                            children: [
                              Radio(
                                activeColor: AppColors.primaryColor,
                                value: 1,
                                onChanged: (value) {
                                  signUpController.setCameraSelectedOption(value!);
                                },
                                groupValue: signUpController.cameraSelectedOption,
                              ),
                              Text(
                                'No',
                                style: robotoCondensedRegular.copyWith(
                                  fontSize: 15,
                                  color: AppColors.black1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: Row(
                            children: [
                              Radio(
                                activeColor: AppColors.primaryColor,
                                value: 2,
                                onChanged: (value) {
                                  signUpController.setCameraSelectedOption(value!);
                                },
                                groupValue: signUpController.cameraSelectedOption,
                              ),
                              Text(
                                'Yes',
                                style: robotoCondensedRegular.copyWith(
                                  fontSize: 15,
                                  color: AppColors.black1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
                      const SizedBox(width: 17),
                      Expanded(
                        child: PrimaryButton(
                          title: 'Next',
                          bgColor: AppColors.primaryColor,
                          disabledColor: AppColors.primaryColor50,
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
