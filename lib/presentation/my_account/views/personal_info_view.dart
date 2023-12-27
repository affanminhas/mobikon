import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/model/profile_model.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';
import 'package:mobikon/presentation/my_account/widgets/edit_personal_info_sheet.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class PersonalInfoView extends StatelessWidget {
  static const String id = '/personalInfoView';

  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProfileController>(
          builder: (profileController) {
            UserProfile profile = profileController.profile;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 36),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.arrow_back_ios_new_outlined, size: 18),
                          ),
                          const SizedBox(width: 8),
                          Text('Personal info', style: robotoCondensedBold.copyWith(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 44),
                      Text('First Name', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        profile.firstName,
                        style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 24),
                      Text('Last Name', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        profile.lastName,
                        style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 24),
                      Text('Email Address', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        profile.email,
                        style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 24),
                      Text('Phone Number', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        profile.phone,
                        style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: SecondaryButton(
                    bgColor: AppColors.blueColor,
                    onTap: () {
                      profileController.setInitialFormField();
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: const EditInfoSheet(),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.edit, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          'Edit Info',
                          style: robotoCondensedBold.copyWith(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
