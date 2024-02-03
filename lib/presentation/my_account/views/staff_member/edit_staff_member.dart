import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/utilities/validators.dart';
import 'package:mobikon/widgets/custom_appbar.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_dropdown.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class EditStaffMember extends StatelessWidget {
  static const String id = '/edit-staff-member';

  const EditStaffMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const PrimaryAppBar(title: 'Add Staff Member'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              //onChanged: (value) => signUpController.setFirstName(value),
                              hintText: 'First Name',
                              outlineColor: AppColors.lightGrey,
                              validator: (value) => Validator.nameValidator(value),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomTextField(
                              //onChanged: (value) => signUpController.setLastName(value),
                              hintText: 'Last Name',
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
                        validator: (value) => Validator.phoneNumberValidator(value),
                        outlineColor: AppColors.lightGrey,
                      ),
                      const SizedBox(height: 24),
                      Text('Staff Designation', style: robotoCondensedRegular.copyWith(fontSize: 16)),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 55,
                        child: CustomDropDown(
                          items: const ['Manager', 'In-charge'],
                          hintText: 'Designation',
                          onChanged: (value) => {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('Permissions', style: robotoCondensedRegular.copyWith(fontSize: 16)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.lightGrey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    activeColor: AppColors.primaryColor,
                                    onChanged: (value) {},
                                  ),
                                  Text('Add Stock', style: robotoCondensedMedium.copyWith(fontSize: 16))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.lightGrey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    activeColor: AppColors.primaryColor,
                                    onChanged: (value) {},
                                  ),
                                  Text('Reduce Stock', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      bgColor: AppColors.lightGrey4,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancel',
                      textStyle: robotoCondensedBold.copyWith(color: AppColors.darkGrey, fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SecondaryButton(
                      bgColor: AppColors.blueColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            'Save Member',
                            style: robotoCondensedBold.copyWith(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
