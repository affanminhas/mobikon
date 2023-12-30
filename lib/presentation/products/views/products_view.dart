import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/products/views/add_new_product_view.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class MyProductsView extends StatelessWidget {
  const MyProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios_new, size: 18),
                ),
                const SizedBox(width: 16),
                Text('My Products', style: robotoCondensedBold.copyWith(fontSize: 18)),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AddNewProductView.id),
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: AppColors.blueColor),
                      const SizedBox(width: 4),
                      Text(
                        'Add Product',
                        style: robotoCondensedBold.copyWith(fontSize: 14, color: AppColors.blueColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.04),
              border: Border(bottom: BorderSide(color: AppColors.primaryColor.withOpacity(0.1))),
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'You can ',
                    style: robotoCondensedRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      height: 1.7,
                    ),
                  ),
                  TextSpan(
                    text: 'Edit, Add & Delete',
                    style: robotoCondensedMedium.copyWith(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      height: 1.7,
                    ),
                  ),
                  TextSpan(
                    text: ' products here',
                    style: robotoCondensedRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: 'Search Product',
                    hintStyle: robotoCondensedRegular.copyWith(
                      fontSize: 16,
                      color: AppColors.primaryColor.withOpacity(0.5),
                    ),
                    suffixIcon: Icons.search,
                    isSuffixIcon: true,
                    outlineColor: AppColors.primaryColor.withOpacity(0.5),
                    radius: 8,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 1),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(Strings.circuitIcon, width: 70, height: 70),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Circuit Boards',
                                    style: robotoCondensedBold.copyWith(fontSize: 18, color: AppColors.black1),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(Strings.cubeIcon, height: 14, width: 14),
                                      const SizedBox(width: 4),
                                      Text(
                                        '6546 units stored',
                                        style: robotoCondensedRegular.copyWith(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.keyboard_arrow_right_outlined)
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16),
                      itemCount: 10,
                    ),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
