import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';
import 'package:mobikon/utilities/validators.dart';
import 'package:mobikon/widgets/custom_appbar.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class SecurityView extends StatefulWidget {
  static const String id = '/security-view';

  const SecurityView({super.key});

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  bool _isChangePassword = false;
  bool isCurrentPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<ProfileController>(builder: (accountController) {
          return Form(
            key: accountController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const PrimaryAppBar(title: 'Security'),
                if (_isChangePassword)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password should be 8 characters long \nUse alphanumeric characters to make strong password \nUse at least one capital letter in the combination',
                            style: robotoCondensedRegular.copyWith(fontSize: 14, height: 1.7),
                          ),
                          const SizedBox(height: 24),
                          CustomTextField(
                            suffixIcon: isCurrentPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye,
                            isSuffixIcon: true,
                            isPassword: !isCurrentPasswordVisible,
                            onSuffixIconPressed: () {
                              setState(() {
                                isCurrentPasswordVisible = !isCurrentPasswordVisible;
                              });
                            },
                            onChanged: (value) => accountController.setCurrentPassword(value),
                            hintText: 'Current Password',
                            validator: (value) => Validator.passwordValidator(value),
                            outlineColor: AppColors.lightGrey,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            suffixIcon: isNewPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye,
                            isSuffixIcon: true,
                            isPassword: !isNewPasswordVisible,
                            onSuffixIconPressed: () {
                              setState(() {
                                isNewPasswordVisible = !isNewPasswordVisible;
                              });
                            },
                            onChanged: (value) => accountController.setNewPassword(value),
                            hintText: 'New Password',
                            validator: (value) => Validator.passwordValidator(value),
                            outlineColor: AppColors.lightGrey,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            suffixIcon: isConfirmPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye,
                            isSuffixIcon: true,
                            isPassword: !isConfirmPasswordVisible,
                            onSuffixIconPressed: () {
                              setState(() {
                                isConfirmPasswordVisible = !isConfirmPasswordVisible;
                              });
                            },
                            onChanged: (value) => accountController.setConfirmPassword(value),
                            hintText: 'Confirm New Password',
                            validator: (value) => Validator.passwordValidator(value),
                            outlineColor: AppColors.lightGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!_isChangePassword)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Strings.lockPerson, height: 45, width: 45),
                        const SizedBox(height: 16),
                        Text(
                          'Looking To Change Your Password?',
                          style: robotoCondensedMedium.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 66),
                          child: Text(
                            'Click on “Change Password” below to change your password',
                            style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: _isChangePassword
                      ? SecondaryButton(
                          bgColor: AppColors.blueColor,
                          disabledColor: AppColors.primaryColor50,
                          onTap: accountController.isChangePasswordValid
                              ? () {
                                  if (accountController.formKey.currentState?.validate() ?? false) {
                                    Navigator.pop(context);
                                  }
                                }
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check, color: Colors.white),
                              const SizedBox(width: 4),
                              Text(
                                'Save New Password',
                                style: robotoCondensedBold.copyWith(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      : SecondaryButton(
                          bgColor: AppColors.blueColor,
                          onTap: () {
                            setState(() {
                              _isChangePassword = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.edit, color: Colors.white),
                              const SizedBox(width: 4),
                              Text(
                                'Change Password',
                                style: robotoCondensedBold.copyWith(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
