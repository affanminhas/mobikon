import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/stocks/views/stock_entry_view.dart';
import 'package:mobikon/presentation/stocks/widgets/delete_entry_dialog.dart';
import 'package:mobikon/widgets/custom_appbar.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class AddStockView extends StatelessWidget {
  static const String id = 'add_stock_view';

  const AddStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
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
        child: PrimaryButton(
          bgColor: AppColors.blueColor,
          onTap: () {
            Navigator.pop(context);
          },
          title: 'Submit Stock Entries',
        ),
      ),
      body: SafeArea(
        child: Column(
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
              child: ListView.separated(
                itemBuilder: (context, index) {
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
                                'Dell Mouse (17 units)',
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
                                        onConfirm: () {},
                                      );
                                    },
                                  );
                                },
                                child: const Icon(Icons.close, size: 22),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Container # 01 / Shelf 1',
                                style: robotoCondensedRegular.copyWith(fontSize: 16),
                              ),
                              const Spacer(),
                              Text(
                                '+5 units',
                                style: robotoCondensedRegular.copyWith(fontSize: 16, color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
