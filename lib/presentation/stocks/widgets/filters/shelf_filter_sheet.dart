import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/stocks/controllers/stock_controller.dart';
import 'package:mobikon/presentation/stocks/model/shelf_model.dart';
import 'package:mobikon/widgets/custom_empty_widget.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class ShelfFilterSheet extends StatelessWidget {
  const ShelfFilterSheet({super.key});

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
                      onChanged: (value) => stockController.onSearchShelf(value),
                      hintText: 'Search Shelf',
                      radius: 10,
                      keyBoardType: TextInputType.emailAddress,
                      outlineColor: AppColors.lightGrey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GetBuilder<StockController>(builder: (stockController) {
                      return (stockController.shelfSearchText.isEmpty
                              ? stockController.shelves.isEmpty
                              : stockController.filteredShelves.isEmpty)
                          ? const Center(
                              child: EmptyData(
                                title: 'No Shelf Found!',
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                Shelf shelf = stockController.shelfSearchText.isEmpty
                                    ? stockController.shelves[index]
                                    : stockController.filteredShelves[index];
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(Strings.containerAsset),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        shelf.name,
                                        style: robotoCondensedBold.copyWith(fontSize: 18),
                                      ),
                                      const Spacer(),
                                      Checkbox(
                                        value: stockController.selectedFilterShelf.contains(shelf) ? true : false,
                                        activeColor: AppColors.blueColor,
                                        onChanged: (value) {
                                          stockController.onSelectShelfFilter(shelf);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  Divider(color: AppColors.greyColor.withOpacity(0.2)),
                              itemCount: stockController.shelfSearchText.isEmpty
                                  ? stockController.shelves.length
                                  : stockController.filteredShelves.length,
                            );
                    }),
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
