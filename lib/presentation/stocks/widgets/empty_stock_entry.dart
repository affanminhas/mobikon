import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/stocks/views/stock_entry_view.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class EmptyStockEntry extends StatelessWidget {
  const EmptyStockEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Strings.sadIcon, width: 38, height: 38),
        const SizedBox(height: 16),
        Text(
          'No Stock Entry Added',
          style: robotoCondensedBold.copyWith(fontSize: 16),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Click ',
                style: robotoCondensedRegular.copyWith(
                  fontSize: 14,
                  color: AppColors.darkGrey,
                  height: 1.7,
                ),
              ),
              TextSpan(
                text: 'Add Stock Entry',
                style: robotoCondensedBold.copyWith(
                  fontSize: 14,
                  color: AppColors.darkGrey,
                  height: 1.7,
                ),
              ),
              TextSpan(
                text: ' to add a new stock entry',
                style: robotoCondensedRegular.copyWith(
                  fontSize: 14,
                  color: AppColors.darkGrey,
                  height: 1.7,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.40,
          height: 46,
          child: PrimaryButton(
            bgColor: Colors.white,
            onTap: () {
              Navigator.pushNamed(context, StockEntryView.id);
            },
            title: '',
            borderColor: AppColors.blueColor,
            textStyle: robotoCondensedBold.copyWith(color: AppColors.blueColor, fontSize: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add, size: 20, color: AppColors.blueColor),
                const SizedBox(width: 8),
                Text(
                  'Add Stock Entry',
                  style: robotoCondensedBold.copyWith(color: AppColors.blueColor, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
