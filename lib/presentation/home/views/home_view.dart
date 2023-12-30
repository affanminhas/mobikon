import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/home/views/container/container_detaill_view.dart';
import 'package:mobikon/presentation/my_account/model/profile_model.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<ProfileController>(
          builder: (profileController) {
            UserProfile profile = profileController.profile;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    height: 240,
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 86),
                        Image.asset(Strings.waveIcon, width: 25, height: 25),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome Back! ${profile.firstName}',
                                    style: robotoCondensedBold.copyWith(fontSize: 24, color: AppColors.bgColor),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'You can always access your containers and details from here',
                                    style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.bgColor),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.notifications, color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Recent Activity', style: robotoCondensedBold.copyWith(fontSize: 18)),
                        const SizedBox(height: 4),
                        Text(
                          'Check your container progress here',
                          style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 135,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.none,
                            child: Row(
                              children: [
                                ...List.generate(
                                  5,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, ContainerDetailView.id);
                                      },
                                      child: Container(
                                        width: 185,
                                        height: 140,
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        margin: const EdgeInsets.only(right: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.1),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(Strings.containerAsset, height: 48, width: 45),
                                            const SizedBox(height: 8),
                                            Text('Container #${index + 1}',
                                                style: robotoCondensedBold.copyWith(fontSize: 14)),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Image.asset(Strings.cubeIcon, height: 14, width: 14),
                                                const SizedBox(width: 4),
                                                Text('6546 total units stored',
                                                    style: robotoCondensedRegular.copyWith(fontSize: 14)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text('Pending Approvals', style: robotoCondensedBold.copyWith(fontSize: 18)),
                        const SizedBox(height: 4),
                        Text(
                          'Check your package progress here',
                          style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 13,
                                          backgroundColor: AppColors.blueColor.withOpacity(0.2),
                                          child: const CircleAvatar(
                                            radius: 8,
                                            backgroundColor: AppColors.blueColor,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text('Container Renting', style: robotoCondensedBold.copyWith(fontSize: 18)),
                                        const Spacer(),
                                        Text(
                                          'In Progress',
                                          style: robotoCondensedRegular.copyWith(
                                            fontSize: 18,
                                            color: AppColors.black1.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Container',
                                      style: robotoCondensedRegular.copyWith(
                                        fontSize: 16,
                                        color: AppColors.black1.withOpacity(0.5),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text('#04', style: robotoCondensedRegular.copyWith(fontSize: 16)),
                                        const Spacer(),
                                        Text(
                                          'View More Details',
                                          style: robotoCondensedMedium.copyWith(
                                            fontSize: 14,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.keyboard_arrow_right),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 16),
                            itemCount: 5,
                          ),
                        ),
                        const SizedBox(height: 65),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 160,
            margin: const EdgeInsets.only(bottom: 100),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: BoxDecoration(
              color: AppColors.blueColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.add, color: Colors.white),
                const SizedBox(width: 4),
                Text('Rent Container', style: robotoCondensedMedium.copyWith(fontSize: 16, color: Colors.white)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
