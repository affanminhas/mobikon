import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';

class CustomLoadingButton extends StatelessWidget {
  final String text;

  const CustomLoadingButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[300],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: robotoCondensedBold.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
