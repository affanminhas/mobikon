import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';

class SignUpStepper extends StatelessWidget {
  final bool isBasicInfo;
  final bool isBasicInfoDone;
  final bool isSecurity;
  final bool isSecurityDone;
  final bool isBusinessInfo;
  final bool isBusinessInfoDone;

  const SignUpStepper({
    this.isBasicInfo = false,
    this.isBasicInfoDone = false,
    this.isSecurity = false,
    this.isSecurityDone = false,
    this.isBusinessInfo = false,
    this.isBusinessInfoDone = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (isBasicInfo)
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryColor.withOpacity(0.10),
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            if (!isBasicInfo)
              CircleAvatar(
                radius: 12,
                backgroundColor: isBasicInfoDone ? AppColors.primaryColor : AppColors.lightGrey3,
              ),
            Expanded(
              child: Container(
                height: 2,
                color: AppColors.lightGrey3,
              ),
            ),
            if (isSecurity)
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryColor.withOpacity(0.10),
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            if (!isSecurity)
              CircleAvatar(
                radius: 12,
                backgroundColor: isSecurityDone ? AppColors.primaryColor : AppColors.lightGrey3,
              ),
            Expanded(
              child: Container(
                height: 2,
                color: AppColors.lightGrey3,
              ),
            ),
            if (isBusinessInfo)
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryColor.withOpacity(0.10),
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            if (!isBusinessInfo)
              CircleAvatar(
                radius: 12,
                backgroundColor: isBusinessInfoDone ? AppColors.primaryColor : AppColors.lightGrey3,
              ),
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Basic Info',
                style: robotoCondensedMedium.copyWith(
                  fontSize: 16,
                  color: isBasicInfo ? AppColors.primaryColor : AppColors.primaryColor50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Security',
                  style: robotoCondensedMedium.copyWith(
                    fontSize: 16,
                    color: isSecurity ? AppColors.primaryColor : AppColors.primaryColor50,
                  ),
                ),
              ),
              Text(
                'Business Info',
                style: robotoCondensedMedium.copyWith(
                  fontSize: 16,
                  color: isBusinessInfo ? AppColors.primaryColor : AppColors.primaryColor50,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
