import 'package:flutter/material.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/stocks/views/add_stock_view.dart';
import 'package:mobikon/widgets/custom_appbar.dart';

class StockHistoryView extends StatelessWidget {
  static const String id = 'stock_history_view';

  const StockHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 22),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SecondaryAppBar(
                title: 'Stock History',
                routeName: AddStockView.id,
                actionText: 'Add Entries',
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
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
                        Image.asset(Strings.emailLogo, width: 74, height: 74),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dell Mouse', style: robotoCondensedSemiBold.copyWith(fontSize: 18)),
                              const SizedBox(height: 4),
                              Text('Container 1  /  Shelf 1', style: robotoCondensedRegular.copyWith(fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(Strings.personAsset, width: 10, height: 10),
                                      const SizedBox(width: 5),
                                      Text('Syed Maaz', style: robotoCondensedRegular.copyWith(fontSize: 12)),
                                    ],
                                  ),
                                  const SizedBox(width: 8),
                                  Row(
                                    children: [
                                      Image.asset(Strings.calendarAsset, width: 10, height: 10),
                                      const SizedBox(width: 5),
                                      Text('8 Jan 2023, 2:00 pm', style: robotoCondensedRegular.copyWith(fontSize: 12)),
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
                            const Icon(Icons.arrow_upward, size: 25, color: Colors.green),
                            Text('18', style: robotoCondensedRegular.copyWith(fontSize: 18, color: Colors.green)),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
