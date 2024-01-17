import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/stocks/controllers/stock_controller.dart';
import 'package:mobikon/presentation/stocks/model/stock_history_model.dart';
import 'package:mobikon/presentation/stocks/views/add_stock_view.dart';
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
  @override
  void initState() {
    super.initState();
    //Get.find<StockController>().getAllStockHistory();
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SecondaryAppBar(
                    title: 'Stock History',
                    routeName: AddStockView.id,
                    actionText: 'Add Entries',
                    isBackButtonRequired: false,
                  ),
                ),
                const SizedBox(height: 30),
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
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    int reversedIndex = stockController.stockHistory.records.length - index - 1;
                                    StockHistoryRecord record = stockController.stockHistory.records[reversedIndex];
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
                                                        Image.asset(Strings.personAsset, width: 10, height: 10),
                                                        const SizedBox(width: 5),
                                                        Text(record.createdBy,
                                                            style: robotoCondensedRegular.copyWith(fontSize: 12)),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Row(
                                                      children: [
                                                        Image.asset(Strings.calendarAsset, width: 10, height: 10),
                                                        const SizedBox(width: 5),
                                                        Text(
                                                          record.createdAt,
                                                          style: robotoCondensedRegular.copyWith(fontSize: 12),
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
                                                const Icon(Icons.arrow_upward, size: 25, color: AppColors.greenColor),
                                              if (record.type == 'Reduction')
                                                const Icon(Icons.arrow_downward, size: 25, color: AppColors.redColor3),
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
                                  itemCount: stockController.stockHistory.records.length,
                                ),
                        ),
                ),
                SizedBox(height: 90)
              ],
            );
          },
        ),
      ),
    );
  }
}
