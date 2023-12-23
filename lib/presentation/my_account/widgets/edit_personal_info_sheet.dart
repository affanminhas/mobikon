import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/utilities/validators.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class EditInfoSheet extends StatefulWidget {
  const EditInfoSheet({super.key});

  @override
  State<EditInfoSheet> createState() => _EditInfoSheetState();
}

class _EditInfoSheetState extends State<EditInfoSheet> {
  final GlobalKey<FormState> _editInfoFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editInfoFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey3,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Edit Details', style: robotoCondensedBold.copyWith(fontSize: 18)),
            Text(
              'You can edit your details here',
              style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    //onChanged: (value) => signUpController.setBusinessName(value),
                    hintText: 'First Name',
                    showErrorMessage: false,
                    outlineColor: AppColors.lightGrey,
                    validator: (value) => Validator.nameValidator(value),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    //onChanged: (value) => signUpController.setBusinessType(value),
                    hintText: 'Last Name',
                    showErrorMessage: false,
                    outlineColor: AppColors.lightGrey,
                    validator: (value) => Validator.nameValidator(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              //onChanged: (value) => signUpController.setEmail(value),
              hintText: 'Email Address',
              keyBoardType: TextInputType.emailAddress,
              validator: (value) => Validator.emailValidator(value),
              outlineColor: AppColors.lightGrey,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              //onChanged: (value) => signUpController.setPhoneNumber(value),
              hintText: 'Phone Number',
              keyBoardType: TextInputType.phone,
              validator: (value) => Validator.phoneNumberFullValidator(value),
              outlineColor: AppColors.lightGrey,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              bgColor: AppColors.blueColor,
              onTap: () {
                if (_editInfoFormKey.currentState?.validate() ?? false) {
                  //Navigator.pushNamed(context, LoginView.id);
                }
              },
              title: 'Save Changes',
            ),
          ],
        ),
      ),
    );
  }
}
