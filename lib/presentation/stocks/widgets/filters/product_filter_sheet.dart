import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/products/controller/product_controller.dart';
import 'package:mobikon/presentation/products/model/product_model.dart';
import 'package:mobikon/presentation/stocks/controllers/stock_controller.dart';
import 'package:mobikon/widgets/custom_image_builder.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class ProductFilterSheet extends StatefulWidget {
  const ProductFilterSheet({super.key});

  @override
  State<ProductFilterSheet> createState() => _ProductFilterSheetState();
}

class _ProductFilterSheetState extends State<ProductFilterSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: GetBuilder<StockController>(builder: (stockController) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      width: 70,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey3.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'Apply Filters',
                      style: robotoCondensedBold.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomTextField(
                      onChanged: (value) => stockController.onSearchShelfProduct(value),
                      hintText: 'Search Product',
                      radius: 10,
                      keyBoardType: TextInputType.emailAddress,
                      outlineColor: AppColors.lightGrey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GetBuilder<ProductController>(
                      builder: (productController) {
                        return GetBuilder<StockController>(builder: (stockController) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              Product product = productController.productList[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CustomCashedImage(
                                        image: product.thumbnail,
                                        shape: BoxShape.rectangle,
                                        width: 75,
                                        height: 75,
                                        loaderHeight: 75,
                                        loaderWidth: 75,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      product.name,
                                      style: robotoCondensedBold.copyWith(fontSize: 18),
                                    ),
                                    const Spacer(),
                                    Checkbox(
                                      value: stockController.selectedFilterProducts.contains(product) ? true : false,
                                      activeColor: AppColors.blueColor,
                                      onChanged: (value) {
                                        stockController.onSelectProductFilter(product);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(color: AppColors.greyColor.withOpacity(0.2)),
                            itemCount: productController.productList.length,
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
