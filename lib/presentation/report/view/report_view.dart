import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/home/home_controller.dart';
import 'package:mobikon/presentation/home/widgets/menu_item_view.dart';
import 'package:mobikon/presentation/products/controller/product_controller.dart';
import 'package:mobikon/presentation/report/widgets/download_sheet.dart';
import 'package:mobikon/presentation/stocks/controllers/stock_controller.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text('Reports', style: robotoCondensedBold.copyWith(fontSize: 18)),
                    const Spacer(),
                    const Icon(Icons.more_vert, color: AppColors.blueColor),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Divider(color: AppColors.greyColor.withOpacity(0.15), thickness: 1, height: 0),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: GetBuilder<HomeController>(builder: (homeController) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const PDFDownloadSheet(title: 'Containers Report');
                              },
                            );
                          },
                          child: MenuItemView(
                            title: 'Containers',
                            value: homeController.allContainer.length.toString(),
                            subTitle: '2 Containers Requested',
                            titleStyle: robotoCondensedRegular.copyWith(fontSize: 14),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: GetBuilder<ProductController>(builder: (productController) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const PDFDownloadSheet(title: 'Products Report');
                              },
                            );
                          },
                          child: MenuItemView(
                            title: 'Products',
                            value: productController.productList.length.toString(),
                            subTitle: '24 Products Added',
                            titleStyle: robotoCondensedRegular.copyWith(fontSize: 14),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const PDFDownloadSheet(title: 'Staff Members Report');
                            },
                          );
                        },
                        child: MenuItemView(
                          title: 'Staff Members',
                          value: '5',
                          subTitle: '26 Added',
                          titleStyle: robotoCondensedRegular.copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const PDFDownloadSheet(title: 'Stocks Report');
                            },
                          );
                        },
                        child: GetBuilder<StockController>(builder: (stockController) {
                          return MenuItemView(
                            title: 'Stocks',
                            value: stockController.stockHistory.records.length.toString(),
                            subTitle: '26 Added',
                            titleStyle: robotoCondensedRegular.copyWith(fontSize: 14),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
