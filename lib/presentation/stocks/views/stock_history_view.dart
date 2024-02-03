import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/stocks/controllers/stock_controller.dart';
import 'package:mobikon/presentation/stocks/model/stock_history_model.dart';
import 'package:mobikon/presentation/stocks/views/add_stock_view.dart';
import 'package:mobikon/presentation/stocks/widgets/filters/product_filter_sheet.dart';
import 'package:mobikon/presentation/stocks/widgets/filters/shelf_filter_sheet.dart';
import 'package:mobikon/widgets/custom_appbar.dart';
import 'package:mobikon/widgets/custom_empty_widget.dart';
import 'package:mobikon/widgets/custom_image_builder.dart';
import 'package:mobikon/widgets/custom_loaders.dart';

class StockHistoryView extends StatefulWidget {
  static const String id = 'stock_history_view';

  const StockHistoryView({super.key});

  @override
  State<StockHistoryView> createState() => _StockHistoryViewState();
}

class _StockHistoryViewState extends State<StockHistoryView> {
  bool _isProductSelected = false;
  bool _isShelfSelected = false;

  @override
  void initState() {
    super.initState();
    Get.find<StockController>().getAllShelves();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<StockController>(
          builder: (stockController) {
            return Column(
              children: [
                const SizedBox(height: 22),
                const SecondaryAppBar(
                  title: 'Stock History',
                  routeName: AddStockView.id,
                  actionText: 'Add Entries',
                  isBackButtonRequired: false,
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: stockController.isLoading
                      ? const Center(child: PrimaryLoader())
                      : RefreshIndicator(
                          color: AppColors.primaryColor,
                          onRefresh: () async {
                            await Get.find<StockController>().getAllStockHistory();
                          },
                          child: stockController.stockHistory.records.isEmpty
                              ? const Center(
                                  child: EmptyData(
                                    title: 'No Stocks Found!',
                                  ),
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          Image.asset(Strings.filterIcon, height: 28, width: 28, color: Colors.grey),
                                          const SizedBox(width: 15),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (!_isProductSelected) {
                                                  _isProductSelected = true;
                                                }
                                              });

                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) {
                                                  return Padding(
                                                    padding: MediaQuery.of(context).viewInsets,
                                                    child: const ProductFilterSheet(),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                              decoration: BoxDecoration(
                                                color: stockController.selectedFilterProducts.isNotEmpty
                                                    ? AppColors.primaryColor
                                                    : Colors.white,
                                                borderRadius: BorderRadius.circular(50),
                                                border: Border.all(color: AppColors.primaryColor),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Products',
                                                    style: robotoCondensedRegular.copyWith(
                                                      fontSize: 16,
                                                      color: stockController.selectedFilterProducts.isNotEmpty
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  if (stockController.selectedFilterProducts.isNotEmpty) ...[
                                                    const SizedBox(width: 5),
                                                    const SizedBox(
                                                      width: 15,
                                                      child: Icon(Icons.arrow_drop_down_outlined, color: Colors.white),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (!_isShelfSelected) {
                                                  _isShelfSelected = true;
                                                }
                                              });

                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) {
                                                  return Padding(
                                                    padding: MediaQuery.of(context).viewInsets,
                                                    child: const ShelfFilterSheet(),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                              decoration: BoxDecoration(
                                                color: stockController.selectedFilterShelf.isNotEmpty
                                                    ? AppColors.primaryColor
                                                    : Colors.white,
                                                borderRadius: BorderRadius.circular(50),
                                                border: Border.all(color: AppColors.primaryColor),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Shelves',
                                                    style: robotoCondensedRegular.copyWith(
                                                      fontSize: 16,
                                                      color: stockController.selectedFilterShelf.isNotEmpty
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  if (stockController.selectedFilterShelf.isNotEmpty) ...[
                                                    const SizedBox(width: 5),
                                                    const SizedBox(
                                                      width: 15,
                                                      child: Icon(Icons.arrow_drop_down_outlined, color: Colors.white),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          if (stockController.selectedFilterProducts.isNotEmpty ||
                                              stockController.selectedFilterShelf.isNotEmpty)
                                            InkWell(
                                              onTap: (){
                                                stockController.resetFilter();
                                              },
                                              child: Image.asset(
                                                Strings.resetIcon,
                                                height: 28,
                                                width: 28,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Expanded(
                                      child: stockController.filteredRecords.isEmpty
                                          ? const Center(
                                              child: EmptyData(
                                                title: 'No Record Found!',
                                              ),
                                            )
                                          : ListView.separated(
                                              itemBuilder: (context, index) {
                                                List<StockHistoryRecord> records = stockController.filteredRecords;
                                                int reversedIndex = records.length - index - 1;
                                                StockHistoryRecord record = records[reversedIndex];
                                                return Container(
                                                  margin: const EdgeInsets.symmetric(horizontal: 16),
                                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(0.2),
                                                        spreadRadius: 2,
                                                        blurRadius: 2,
                                                        offset: const Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(8),
                                                        child: CustomCashedImage(
                                                          image: Endpoints.baseUrl + record.product.thumbnail,
                                                          shape: BoxShape.rectangle,
                                                          width: 75,
                                                          height: 75,
                                                          loaderHeight: 75,
                                                          loaderWidth: 75,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 9),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(record.product.name,
                                                                style: robotoCondensedSemiBold.copyWith(fontSize: 18)),
                                                            const SizedBox(height: 4),
                                                            Text(record.shelf,
                                                                style: robotoCondensedRegular.copyWith(fontSize: 16)),
                                                            const SizedBox(height: 4),
                                                            Row(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Image.asset(Strings.personAsset,
                                                                        width: 10, height: 10),
                                                                    const SizedBox(width: 5),
                                                                    Text(record.createdBy,
                                                                        style: robotoCondensedRegular.copyWith(
                                                                            fontSize: 12)),
                                                                  ],
                                                                ),
                                                                const SizedBox(width: 8),
                                                                Row(
                                                                  children: [
                                                                    Image.asset(Strings.calendarAsset,
                                                                        width: 10, height: 10),
                                                                    const SizedBox(width: 5),
                                                                    Text(
                                                                      record.createdAt,
                                                                      style:
                                                                          robotoCondensedRegular.copyWith(fontSize: 12),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          if (record.type == 'Addition')
                                                            const Icon(Icons.arrow_upward,
                                                                size: 25, color: AppColors.greenColor),
                                                          if (record.type == 'Reduction')
                                                            const Icon(Icons.arrow_downward,
                                                                size: 25, color: AppColors.redColor3),
                                                          Text(
                                                            record.quantity.toString(),
                                                            style: robotoCondensedRegular.copyWith(
                                                              fontSize: 18,
                                                              color: record.type == 'Addition'
                                                                  ? AppColors.greenColor
                                                                  : AppColors.redColor3,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                              separatorBuilder: (context, index) => const SizedBox(height: 16),
                                              itemCount: stockController.filteredRecords.length,
                                            ),
                                    ),
                                  ],
                                ),
                        ),
                ),
                const SizedBox(height: 90)
              ],
            );
          },
        ),
      ),
    );
  }
}
