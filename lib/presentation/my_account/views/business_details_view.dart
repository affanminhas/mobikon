import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/model/business_model.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';
import 'package:mobikon/presentation/my_account/widgets/edit_business_info_sheet.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class BusinessDetailsView extends StatelessWidget {
  static const String id = '/business-details-view';

  const BusinessDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProfileController>(
          builder: (profileController) {
            BusinessInfo business = profileController.businessInfo;
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
                          Text('Business Details', style: robotoCondensedBold.copyWith(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 44),
                      Text('Name', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        business.name,
                        style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 24),
                      Text('Type', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        business.type,
                        style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 24),
                      Text('Description', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        business.description,
                        style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 24),
                      Text('Location', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        business.location,
                        style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 24),
                      // Text('Camera Required', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      // const SizedBox(height: 8),
                      // Text(
                      //   'Yes',
                      //   style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      // ),
                      // const SizedBox(height: 24),
                      // Text('Shelves Required', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                      // const SizedBox(height: 8),
                      // Text(
                      //   'Yes',
                      //   style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                      // ),
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
                      profileController.setInitialBusinessFormField();
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: const EditBusinessInfoSheet(),
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
