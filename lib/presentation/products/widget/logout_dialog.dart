import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Image.asset(
            Strings.logoutIcon,
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Logout?',
              style: robotoCondensedBold.copyWith(fontSize: 20),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'By clicking on ',
                  style: robotoCondensedRegular.copyWith(
                    fontSize: 14,
                    color: AppColors.darkGrey,
                    height: 1.7,
                  ),
                ),
                TextSpan(
                  text: 'Yes, Logout',
                  style: robotoCondensedMedium.copyWith(
                    fontSize: 14,
                    color: AppColors.black1,
                    height: 1.7,
                  ),
                ),
                TextSpan(
                  text: ' you will be logged out of the app.',
                  style: robotoCondensedRegular.copyWith(
                    fontSize: 14,
                    color: AppColors.darkGrey,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: robotoCondensedMedium.copyWith(
                          fontSize: 16,
                          color: AppColors.black1.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.find<ProfileController>().logout();
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.redColor2.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Yes, Logout',
                        style: robotoCondensedMedium.copyWith(
                          fontSize: 16,
                          color: AppColors.redColor2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
