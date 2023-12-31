import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/model/profile_model.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';
import 'package:mobikon/presentation/my_account/views/business_details_view.dart';
import 'package:mobikon/presentation/my_account/views/notification_view.dart';
import 'package:mobikon/presentation/my_account/views/personal_info_view.dart';
import 'package:mobikon/presentation/my_account/views/qr_scan_view.dart';
import 'package:mobikon/presentation/my_account/views/security_view.dart';
import 'package:mobikon/presentation/my_account/views/staff_member/staff_members_view.dart';
import 'package:mobikon/presentation/my_account/widgets/account_item.dart';
import 'package:mobikon/widgets/custom_image_builder.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProfileController>(
        builder: (profileController) {
          UserProfile profile = profileController.profile;
          return Column(
            children: [
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_new_outlined, size: 18),
                    const SizedBox(width: 8),
                    Text('My Account', style: robotoCondensedBold.copyWith(fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  //color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomCashedImage(image: Endpoints.baseUrl + profile.profilePicture),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(Icons.edit, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${profile.firstName} ${profile.lastName}',
                          style: robotoCondensedBold.copyWith(fontSize: 20),
                        ),
                        Text(
                          'Mozak LLC',
                          style: robotoCondensedRegular.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // CustomCashedImage(
                    //   image: Endpoints.baseUrl + profile.qrCode,
                    //   shape: BoxShape.rectangle,
                    //   width: 70,
                    //   height: 70,
                    // ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, QRScanView.id),
                      child: Image.asset(Strings.qrCode, width: 48, height: 48),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                child: Column(
                  children: [
                    AccountItem(
                      title: 'Personal Info',
                      icon: Icons.person_outline,
                      onTap: () => Navigator.pushNamed(context, PersonalInfoView.id),
                    ),
                    const SizedBox(height: 30),
                    AccountItem(
                      title: 'Business Details',
                      icon: Icons.cases_outlined,
                      onTap: () => Navigator.pushNamed(context, BusinessDetailsView.id),
                    ),
                    const SizedBox(height: 30),
                    AccountItem(
                      title: 'Staff Members',
                      icon: Icons.person,
                      onTap: () => Navigator.pushNamed(context, StaffMembersView.id),
                    ),
                    const SizedBox(height: 30),
                    AccountItem(
                      title: 'Notifications',
                      icon: Icons.notifications,
                      onTap: () => Navigator.pushNamed(context, NotificationView.id),
                    ),
                    const SizedBox(height: 30),
                    AccountItem(
                      title: 'Security',
                      icon: Icons.security,
                      onTap: () => Navigator.pushNamed(context, SecurityView.id),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
