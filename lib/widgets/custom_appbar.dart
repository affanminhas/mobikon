import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';

class PrimaryAppBar extends StatelessWidget {
  final String title;

  const PrimaryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new, size: 18),
        ),
        const SizedBox(width: 16),
        Text(title, style: robotoCondensedBold.copyWith(fontSize: 18)),
      ],
    );
  }
}

class SecondaryAppBar extends StatelessWidget {
  final String title;
  final String routeName;
  final String actionText;
  final bool isBackButtonRequired;

  const SecondaryAppBar({
    super.key,
    required this.title,
    required this.routeName,
    required this.actionText,
    this.isBackButtonRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isBackButtonRequired)
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new, size: 20),
          ),
        const SizedBox(width: 10),
        Text(title, style: robotoCondensedBold.copyWith(fontSize: 18)),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, routeName),
          child: Row(
            children: [
              const Icon(Icons.add, color: AppColors.blueColor),
              const SizedBox(width: 4),
              Text(
                actionText,
                style: robotoCondensedBold.copyWith(fontSize: 14, color: AppColors.blueColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
