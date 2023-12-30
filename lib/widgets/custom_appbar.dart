import 'package:flutter/material.dart';
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
