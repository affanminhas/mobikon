import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/stocks/controllers/stock_controller.dart';
import 'package:mobikon/presentation/stocks/model/shelf_product_model.dart';
import 'package:mobikon/widgets/custom_empty_widget.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class SelectProductSheet extends StatelessWidget {
  const SelectProductSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: GetBuilder<StockController>(
          builder: (stockController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    width: 70,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey3,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text('Select Product', style: robotoCondensedBold.copyWith(fontSize: 18)),
                const SizedBox(height: 16),
                CustomTextField(
                  onChanged: (value) => stockController.onSearchShelfProduct(value),
                  hintText: 'Search',
                  radius: 10,
                  keyBoardType: TextInputType.emailAddress,
                  outlineColor: AppColors.lightGrey,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: (stockController.shelfProductSearchText.isEmpty
                          ? stockController.shelfProduct.isEmpty
                          : stockController.filteredShelfProducts.isEmpty)
                      ? const Center(
                          child: EmptyData(
                            title: 'No Shelf Product Found!',
                          ),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            ShelfProduct shelfProduct = stockController.shelfProductSearchText.isEmpty
                                ? stockController.shelfProduct[index]
                                : stockController.filteredShelfProducts[index];
                            return GestureDetector(
                              onTap: () {
                                stockController.setSelectedShelfProduct(shelfProduct);
                                Navigator.pop(context);
                              },
                              child: Text(
                                shelfProduct.name,
                                style: robotoCondensedRegular.copyWith(fontSize: 18),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                          itemCount: stockController.shelfProductSearchText.isEmpty
                              ? stockController.shelfProduct.length
                              : stockController.filteredShelfProducts.length,
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
