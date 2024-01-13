import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';

class EmptyData extends StatelessWidget {
  final String? title;
  final double width;
  final double height;
  final double fontSize;

  const EmptyData({super.key, this.title, this.width = 200, this.height = 200, this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Strings.emptyAnim, width: width, height: height),
        Text(
          title ?? 'No Data Found',
          style: robotoCondensedMedium.copyWith(fontSize: fontSize, color: AppColors.black1),
        ),
      ],
    );
  }
}
