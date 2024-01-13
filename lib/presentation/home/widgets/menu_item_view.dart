import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';

class MenuItemView extends StatelessWidget {
  final String title;
  final String value;
  final String subTitle;

  const MenuItemView({
    super.key,
    required this.title,
    required this.value,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: robotoCondensedBold.copyWith(fontSize: 16),
                ),
              ),
              const Icon(Icons.arrow_forward, size: 20, color: AppColors.black1),
            ],
          ),
          const SizedBox(height: 4),
          Text(value, style: robotoCondensedBold.copyWith(fontSize: 24)),
          const SizedBox(height: 4),
          Text(
            subTitle,
            style: robotoCondensedRegular.copyWith(
              fontSize: 14,
              color: AppColors.black1.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
