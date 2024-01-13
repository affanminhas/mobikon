import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/products/controller/product_controller.dart';
import 'package:mobikon/presentation/products/model/product_model.dart';
import 'package:mobikon/presentation/products/views/add_new_product_view.dart';
import 'package:mobikon/presentation/products/views/product_preview.dart';
import 'package:mobikon/widgets/custom_empty_widget.dart';
import 'package:mobikon/widgets/custom_image_builder.dart';
import 'package:mobikon/widgets/custom_loaders.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class MyProductsView extends StatefulWidget {
  const MyProductsView({super.key});

  @override
  State<MyProductsView> createState() => _MyProductsViewState();
}

class _MyProductsViewState extends State<MyProductsView> {
  @override
  void initState() {
    super.initState();

    if (Get.find<ProductController>().productList.isEmpty) {
      Get.find<ProductController>().getAllProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProductController>(
        builder: (productController) {
          return Column(
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
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
                        onChanged: (value) {
                          productController.onSearchProduct(value);
                        },
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
                        child: productController.isLoading
                            ? const Center(child: PrimaryLoader())
                            : (productController.searchText.isEmpty
                                    ? productController.productList.isEmpty
                                    : productController.filteredProductList.isEmpty)
                                ? const Center(
                                    child: EmptyData(
                                      title: 'No Product Found!',
                                    ),
                                  )
                                : RefreshIndicator(
                                    color: AppColors.primaryColor,
                                    onRefresh: () async {
                                      await Get.find<ProductController>().getAllProducts();
                                    },
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        int reverseIndex = productController.searchText.isEmpty
                                            ? productController.productList.length - index - 1
                                            : productController.filteredProductList.length - index - 1;
                                        Product product = productController.searchText.isEmpty
                                            ? productController.productList[reverseIndex]
                                            : productController.filteredProductList[reverseIndex];
                                        return GestureDetector(
                                          onTap: () {
                                            productController.getProduct(product.id);
                                            Navigator.pushNamed(
                                              context,
                                              ProductPreview.id,
                                            );
                                          },
                                          child: Container(
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
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(8),
                                                  child: CustomCashedImage(
                                                    image: product.thumbnail,
                                                    shape: BoxShape.rectangle,
                                                    width: 70,
                                                    height: 70,
                                                    loaderHeight: 70,
                                                    loaderWidth: 70,
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      product.name,
                                                      style: robotoCondensedBold.copyWith(
                                                          fontSize: 18, color: AppColors.black1),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(Strings.cubeIcon, height: 14, width: 14),
                                                        const SizedBox(width: 4),
                                                        Text(
                                                          '${product.quantity} units stored',
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
                                          ),
                                        );
                                      },
                                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16),
                                      itemCount: productController.searchText.isEmpty
                                          ? productController.productList.length
                                          : productController.filteredProductList.length,
                                    ),
                                  ),
                      ),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
