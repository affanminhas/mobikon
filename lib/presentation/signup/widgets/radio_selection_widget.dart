import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/signup/signup_controller.dart';

class RadioSelectionContainer extends StatelessWidget {
  final int groupValue;
  final String firstOption;
  final String secondOption;
  final Function(int?)? onChanged;

  const RadioSelectionContainer({
    super.key,
    required this.groupValue,
    this.firstOption = 'No',
    this.secondOption = 'Yes',
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (signUpController) {
        return Row(
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
                      onChanged: onChanged,
                      groupValue: groupValue,
                    ),
                    Text(
                      firstOption,
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
                      onChanged: onChanged,
                      groupValue: groupValue,
                    ),
                    Text(
                      secondOption,
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
        );
      },
    );
  }
}
