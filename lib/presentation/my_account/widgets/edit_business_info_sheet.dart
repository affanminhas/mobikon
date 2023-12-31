import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/model/business_model.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';
import 'package:mobikon/utilities/validators.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_loader.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class EditBusinessInfoSheet extends StatefulWidget {
  const EditBusinessInfoSheet({super.key});

  @override
  State<EditBusinessInfoSheet> createState() => _EditBusinessInfoSheetState();
}

class _EditBusinessInfoSheetState extends State<EditBusinessInfoSheet> {
  final GlobalKey<FormState> _editInfoFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editInfoFormKey,
      child: GetBuilder<ProfileController>(
        builder: (accountController) {
          BusinessInfo business = accountController.businessInfo;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
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
                          onChanged: (value) => accountController.setBusinessName(value),
                          hintText: 'Business Name',
                          initialValue: business.name,
                          showErrorMessage: false,
                          outlineColor: AppColors.lightGrey,
                          validator: (value) => Validator.validateOnly(value),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          onChanged: (value) => accountController.setBusinessType(value),
                          hintText: 'Business Type',
                          initialValue: business.type,
                          showErrorMessage: false,
                          outlineColor: AppColors.lightGrey,
                          validator: (value) => Validator.validateOnly(value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => accountController.setBusinessLocation(value),
                    hintText: 'Business Location',
                    outlineColor: AppColors.lightGrey,
                    initialValue: business.location,
                    validator: (value) => Validator.formValidate(value, 'Please enter business location'),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => accountController.setBusinessDescription(value),
                    hintText: 'Business Description',
                    outlineColor: AppColors.lightGrey,
                    initialValue: business.description,
                    validator: (value) => Validator.formApiValidate(
                      value,
                      'Please enter tax number',
                      '',
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Text(
                  //   'Container Preferences',
                  //   style: robotoCondensedRegular.copyWith(fontSize: 16),
                  // ),
                  // const SizedBox(height: 16),
                  // RadioSelectionContainer(
                  //   groupValue: accountController.cameraSelectedOption,
                  //   onChanged: (value) {
                  //     accountController.setCameraSelectedOption(value!);
                  //   },
                  // ),
                  // const SizedBox(height: 16),
                  // Text(
                  //   'Shelves Required For Container?',
                  //   style: robotoCondensedRegular.copyWith(fontSize: 16),
                  // ),
                  // const SizedBox(height: 16),
                  // RadioSelectionContainer(
                  //   groupValue: accountController.shelvesSelectedOption,
                  //   onChanged: (value) {
                  //     accountController.setShelvesSelectedOption(value!);
                  //   },
                  // ),
                  //const SizedBox(height: 36),
                  accountController.isLoading
                      ? const CustomLoadingButton(
                          text: 'Updating...',
                        )
                      : PrimaryButton(
                          bgColor: AppColors.blueColor,
                          onTap: accountController.isBusinessEditFormValid
                              ? () {
                                  if (_editInfoFormKey.currentState?.validate() ?? false) {
                                    accountController.updateUserBusinessInfo();
                                  }
                                }
                              : null,
                          title: 'Save Changes',
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
