import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/home/home_controller.dart';
import 'package:mobikon/presentation/home/views/container/request_submit_view.dart';
import 'package:mobikon/presentation/signup/widgets/radio_selection_widget.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_dropdown.dart';

class RequestContainerView extends StatelessWidget {
  static const String id = '/request-container-view';

  const RequestContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GetBuilder<HomeController>(
              builder: (homeController) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Request Another Container', style: robotoCondensedBold.copyWith(fontSize: 18)),
                      const SizedBox(height: 24),
                      Text('Container Preferences', style: robotoCondensedRegular.copyWith(fontSize: 16)),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 55,
                        child: CustomDropDown(
                          items: homeController.containerSizes.map((e) => e.size).toList(),
                          hintText: 'Container Size',
                          onChanged: (value) => {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Camera Required For Container?',
                        style: robotoCondensedRegular.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      RadioSelectionContainer(
                        groupValue: homeController.cameraSelectedOption,
                        onChanged: (value) {
                          homeController.setCameraSelectedOption(value!);
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Shelves Required For Container?',
                        style: robotoCondensedRegular.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      RadioSelectionContainer(
                        groupValue: homeController.shelvesSelectedOption,
                        onChanged: (value) {
                          homeController.setShelvesSelectedOption(value!);
                        },
                      ),
                      const SizedBox(height: 36),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      bgColor: AppColors.lightGrey4,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancel',
                      textStyle: robotoCondensedBold.copyWith(color: AppColors.darkGrey, fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      bgColor: AppColors.blueColor,
                      onTap: () {
                        Navigator.pushNamed(context, RequestSubmittedView.id);
                      },
                      title: 'Submit Request',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
