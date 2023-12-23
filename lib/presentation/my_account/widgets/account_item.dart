import 'package:flutter/material.dart';
import 'package:mobikon/constants/typography.dart';

class AccountItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const AccountItem({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(title, style: robotoCondensedMedium.copyWith(fontSize: 16)),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_right_rounded, size: 25),
        ],
      ),
    );
  }
}
