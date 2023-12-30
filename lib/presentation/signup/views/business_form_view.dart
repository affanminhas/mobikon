import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/signup/signup_controller.dart';
import 'package:mobikon/presentation/signup/widgets/container_size_sheet.dart';
import 'package:mobikon/utilities/validators.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_loader.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class BusinessFormView extends StatefulWidget {
  static const String id = '/signUpBusinessDetailsView';

  const BusinessFormView({super.key});

  @override
  State<BusinessFormView> createState() => _BusinessFormViewState();
}

class _BusinessFormViewState extends State<BusinessFormView> {
  @override
  void initState() {
    super.initState();
    Get.find<SignUpController>().getContainerSize();
  }

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
              child: Form(
                key: signUpController.businessFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: 36),
                    // const SignUpStepper(isBusinessInfo: true, isBasicInfoDone: true, isSecurityDone: true),
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
                            showErrorMessage: false,
                            outlineColor: AppColors.lightGrey,
                            validator: (value) => Validator.validateOnly(value),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            onChanged: (value) => signUpController.setBusinessType(value),
                            hintText: 'Business Type',
                            showErrorMessage: false,
                            outlineColor: AppColors.lightGrey,
                            validator: (value) => Validator.validateOnly(value),
                          ),
                        ),
                        // Expanded(
                        //   child: SizedBox(
                        //     height: 55,
                        //     child: CustomDropDown(
                        //       items: const ['Electronics', 'Fashion'],
                        //       hintText: 'Business Type',
                        //       onChanged: (value) => signUpController.setBusinessType(value),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      onChanged: (value) => signUpController.setBusinessLocation(value),
                      hintText: 'Business Location',
                      outlineColor: AppColors.lightGrey,
                      validator: (value) => Validator.formValidate(value, 'Please enter business location'),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      onChanged: (value) => signUpController.setBusinessTaxNumber(value),
                      hintText: 'Tax Number',
                      outlineColor: AppColors.lightGrey,
                      validator: (value) => Validator.formApiValidate(
                        value,
                        'Please enter tax number',
                        signUpController.businessTaxErrorMessage,
                      ),
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
                          builder: (context) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: ContainerSizeSheet(),
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
                              signUpController.selectedContainerSize.size.isEmpty
                                  ? 'Container Size'
                                  : signUpController.selectedContainerSize.size,
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
                                  value: 2,
                                  onChanged: (value) {
                                    print('value $value');
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
                                  value: 1,
                                  onChanged: (value) {
                                    print('value $value');
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
                    const SizedBox(height: 16),
                    Text(
                      'Shelves Required For Container?',
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
                                  value: 2,
                                  onChanged: (value) {
                                    signUpController.setShelvesSelectedOption(value!);
                                  },
                                  groupValue: signUpController.shelvesSelectedOption,
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
                                  value: 1,
                                  onChanged: (value) {
                                    signUpController.setShelvesSelectedOption(value!);
                                  },
                                  groupValue: signUpController.shelvesSelectedOption,
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

                    signUpController.isLoading
                        ? const CustomLoadingButton(
                            text: 'Registering Business...',
                          )
                        : PrimaryButton(
                            title: 'Register Business',
                            bgColor: AppColors.primaryColor,
                            disabledColor: AppColors.primaryColor50,
                            onTap: signUpController.isBusinessFormValid
                                ? () {
                                    signUpController.setBusinessTaxErrorMessage('');
                                    if (signUpController.businessFormKey.currentState?.validate() ?? false) {
                                      signUpController.registerBusiness(context);
                                    }
                                  }
                                : null,
                          ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: PrimaryButton(
                    //         title: 'Previous',
                    //         textColor: AppColors.primaryColor,
                    //         textStyle: robotoCondensedBold.copyWith(fontSize: 16),
                    //         bgColor: AppColors.lightGrey2,
                    //         onTap: () => Navigator.pop(context),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 17),
                    //     Expanded(
                    //       child: PrimaryButton(
                    //         title: 'Next',
                    //         bgColor: AppColors.primaryColor,
                    //         disabledColor: AppColors.primaryColor50,
                    //         onTap: signUpController.isBusinessFormValid
                    //             ? () {
                    //                 Navigator.pushNamed(context, SignUpTermsConditionView.id);
                    //               }
                    //             : null,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 31),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
