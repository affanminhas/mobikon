import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/signup/signup_controller.dart';

class ContainerSizeSheet extends StatelessWidget {
  const ContainerSizeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (signUpController) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: 90,
                  height: 7,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Select Container Size',
                style: robotoCondensedBold.copyWith(fontSize: 18),
              ),
              Text(
                'You can select one from below',
                style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
              ),
              Expanded(
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  diameterRatio: 1.8,
                  useMagnifier: true,
                  magnification: 1.2,
                  perspective: 0.01,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    signUpController.setSelectedContainerSize(signUpController.containerSizes[index]);
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) => Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        signUpController.containerSizes[index].size,
                        style: robotoCondensedRegular.copyWith(fontSize: 15),
                      ),
                    ),
                    childCount: signUpController.containerSizes.length,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
