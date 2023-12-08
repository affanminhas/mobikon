import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color textColor;
  final TextStyle? textStyle;
  final Color disabledColor;
  final Function()? onTap;
  final double width;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.title,
    this.textStyle,
    this.bgColor = AppColors.primaryColor,
    this.textColor = AppColors.bgColor,
    this.disabledColor = AppColors.lightGrey,
    required this.onTap,
    this.width = double.infinity,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: width,
      color: bgColor,
      disabledColor: disabledColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: textStyle ?? robotoCondensedRegular.copyWith(color: textColor),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget title;
  final Color bgColor;
  final Color textColor;
  final Function()? onTap;
  final double width;
  final double borderRadius;

  const SecondaryButton({
    super.key,
    required this.title,
    this.bgColor = AppColors.primaryColor,
    this.textColor = AppColors.bgColor,
    this.onTap,
    this.width = double.infinity,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      minWidth: width,
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      onPressed: onTap,
      child: title,
    );
  }
}

class UnderlineTextButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Color? color;

  const UnderlineTextButton({
    super.key,
    this.onTap,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: robotoCondensedRegular.copyWith(
          fontSize: 14,
          decoration: TextDecoration.underline,
          decorationColor: color ?? Colors.white,
          color: color,
        ),
      ),
    );
  }
}