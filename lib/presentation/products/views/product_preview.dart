import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/products/controller/product_controller.dart';
import 'package:mobikon/presentation/products/model/product_model.dart';
import 'package:mobikon/presentation/products/widget/edit_product_sheet.dart';
import 'package:mobikon/widgets/custom_appbar.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_image_builder.dart';
import 'package:mobikon/widgets/custom_loaders.dart';

class ProductPreview extends StatelessWidget {
  static const String id = '/product-detail-view';

  const ProductPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                bgColor: AppColors.redColor2,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.remove, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      'Delete Product',
                      style: robotoCondensedBold.copyWith(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SecondaryButton(
                bgColor: AppColors.blueColor,
                disabledColor: AppColors.primaryColor50,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: const EditProductSheet(),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.edit, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      'Edit Product',
                      style: robotoCondensedBold.copyWith(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ProductController>(
          builder: (productController) {
            Product product = productController.selectedProduct;
            return productController.isLoading
                ? const Center(child: PrimaryLoader())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryAppBar(title: product.name),
                        const SizedBox(height: 16),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CustomCashedImage(
                              image: product.thumbnail,
                              shape: BoxShape.rectangle,
                              width: 140,
                              height: 140,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text('Product Name', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text(
                          product.name,
                          style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                        ),
                        const SizedBox(height: 16),
                        Text('Product Description', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text(
                          product.description,
                          style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                        ),
                        const SizedBox(height: 16),
                        Text('Product Type', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text(
                          product.type,
                          style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                        ),
                        const SizedBox(height: 16),
                        Text('Product Quantity', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text(
                          product.quantity.toString(),
                          style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                        ),
                        const SizedBox(height: 16),
                        Text('Product ID', style: robotoCondensedMedium.copyWith(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text(
                          product.productId.toString(),
                          style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
