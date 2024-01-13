import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/stocks/controllers/stock_controller.dart';
import 'package:mobikon/presentation/stocks/model/stock_post_model.dart';
import 'package:mobikon/presentation/stocks/views/stock_entry_view.dart';
import 'package:mobikon/presentation/stocks/widgets/delete_entry_dialog.dart';
import 'package:mobikon/presentation/stocks/widgets/empty_stock_entry.dart';
import 'package:mobikon/widgets/custom_appbar.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_empty_widget.dart';
import 'package:mobikon/widgets/custom_loader.dart';

class AddStockView extends StatelessWidget {
  static const String id = 'add_stock_view';

  const AddStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GetBuilder<StockController>(
        builder: (stockController) {
          return stockController.stockPostList.isEmpty
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: stockController.isLoading
                      ? const CustomLoadingButton(
                          text: 'Adding Stocks ...',
                        )
                      : PrimaryButton(
                          bgColor: AppColors.blueColor,
                          onTap: () {
                            stockController.addStockEntries();
                          },
                          title: 'Submit Stock Entries',
                        ),
                );
        },
      ),
      body: SafeArea(
        child: GetBuilder<StockController>(
          builder: (stockController) {
            return Column(
              children: [
                const SizedBox(height: 22),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SecondaryAppBar(
                    title: 'New Stock Entries',
                    routeName: StockEntryView.id,
                    actionText: 'Add Stock Entry',
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: stockController.stockPostList.isEmpty
                      ? const Center(
                          child: EmptyStockEntry(),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            StockPost stockPost = stockController.stockPostList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          stockPost.productName ?? '',
                                          style: robotoCondensedBold.copyWith(fontSize: 18),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CustomDeleteDialog(
                                                  title: 'Stock Entry will be removed',
                                                  description: 'Are you sure you want to remove this Stock Entry',
                                                  onConfirm: () {
                                                    stockController.removeStockPost(index);
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child: const Icon(Icons.close, size: 20, color: AppColors.greyColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          stockPost.shelfName ?? '',
                                          style: robotoCondensedRegular.copyWith(fontSize: 16),
                                        ),
                                        const Spacer(),
                                        Text(
                                          stockPost.type == 'A'
                                              ? '+${stockPost.quantity} units'
                                              : '-${stockPost.quantity} units',
                                          style: robotoCondensedRegular.copyWith(
                                            fontSize: 16,
                                            color: stockPost.type == 'A' ? AppColors.greenColor : AppColors.redColor3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                          itemCount: stockController.stockPostList.length,
                        ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
