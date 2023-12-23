import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_dropdown.dart';

class AccessLevelEdit extends StatelessWidget {
  const AccessLevelEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            'Staff Designation',
            style: robotoCondensedRegular.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 55,
            child: CustomDropDown(
              items: const ['Manager', 'In-charge', 'Staff'],
              hintText: 'Designation',
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Permissions',
            style: robotoCondensedRegular.copyWith(fontSize: 16),
          ),
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
          PrimaryButton(
            bgColor: AppColors.blueColor,
            onTap: () {},
            title: 'Save Changes',
          ),
        ],
      ),
    );
  }
}
