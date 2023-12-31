import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/home/home_controller.dart';
import 'package:mobikon/presentation/home/model/container_model.dart';
import 'package:mobikon/presentation/home/views/container/container_detaill_view.dart';
import 'package:mobikon/presentation/home/widgets/menu_item_view.dart';
import 'package:mobikon/presentation/my_account/model/profile_model.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';
import 'package:mobikon/presentation/products/controller/product_controller.dart';
import 'package:mobikon/widgets/custom_empty_widget.dart';
import 'package:mobikon/widgets/custom_image_builder.dart';
import 'package:mobikon/widgets/custom_loaders.dart';

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
                GetBuilder<HomeController>(
                  builder: (homeController) {
                    return Expanded(
                      child: homeController.isLoading
                          ? const Center(child: PrimaryLoader())
                          : RefreshIndicator(
                              onRefresh: () async {
                                homeController.getAllContainers();
                                Get.find<ProductController>().getAllProducts();
                              },
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
                                    if (homeController.allContainer.isEmpty)
                                      const Center(
                                        child: EmptyData(
                                          height: 100,
                                          width: 100,
                                          fontSize: 14,
                                          title: 'No Containers Found!',
                                        ),
                                      )
                                    else
                                      SizedBox(
                                        height: 135,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          clipBehavior: Clip.none,
                                          child: Row(
                                            children: [
                                              ...List.generate(
                                                homeController.allContainer.length,
                                                (index) {
                                                  UserContainer container = homeController.allContainer[index];
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
                                                          CustomCashedImage(
                                                            image: container.thumbnail,
                                                            shape: BoxShape.rectangle,
                                                            width: 50,
                                                            height: 50,
                                                            loaderHeight: 50,
                                                            loaderWidth: 50,
                                                          ),
                                                          const SizedBox(height: 8),
                                                          Text(container.name,
                                                              style: robotoCondensedBold.copyWith(fontSize: 14)),
                                                          const SizedBox(height: 8),
                                                          Row(
                                                            children: [
                                                              Image.asset(Strings.cubeIcon, height: 14, width: 14),
                                                              const SizedBox(width: 4),
                                                              Text(
                                                                '${container.size} units stored',
                                                                style: robotoCondensedRegular.copyWith(fontSize: 14),
                                                              ),
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
                                    Text('Summary', style: robotoCondensedBold.copyWith(fontSize: 18)),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Check your container and products stats',
                                      style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                                    ),
                                    const SizedBox(height: 20),
                                    Expanded(
                                      child: ListView(
                                        padding: const EdgeInsets.all(0),
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: MenuItemView(
                                                  title: 'Total Containers',
                                                  value: homeController.allContainer.length.toString(),
                                                  subTitle: '2 Containers Requested',
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: GetBuilder<ProductController>(builder: (productController) {
                                                  return MenuItemView(
                                                    title: 'Total Products',
                                                    value: productController.productList.length.toString(),
                                                    subTitle: '24 Products Added',
                                                  );
                                                }),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          const Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: MenuItemView(
                                                  title: 'Total Staff Members',
                                                  value: '5',
                                                  subTitle: '26 Added',
                                                ),
                                              ),
                                              SizedBox(width: 16),
                                              Expanded(
                                                child: MenuItemView(
                                                  title: 'Total Stock',
                                                  value: '1890',
                                                  subTitle: '26 Added',
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 65),
                                  ],
                                ),
                              ),
                            ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
