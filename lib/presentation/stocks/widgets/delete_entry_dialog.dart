import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class CustomDeleteDialog extends StatelessWidget {
  final String title;
  final String description;
  final Function onConfirm;

  const CustomDeleteDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: robotoCondensedSemiBold.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  bgColor: AppColors.lightGrey4,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'Cancel',
                  textStyle: robotoCondensedBold.copyWith(color: AppColors.darkGrey, fontSize: 16),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: InkWell(
                  onTap: () {
                    onConfirm();
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.redColor2.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Yes, Delete',
                        style: robotoCondensedMedium.copyWith(
                          fontSize: 16,
                          color: AppColors.redColor2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: PrimaryButton(
              //     bgColor: AppColors.redColor2.withOpacity(0.1),
              //     onTap: () {
              //       Navigator.pop(context);
              //     },
              //     title: 'Yes, Delete',
              //     textStyle: robotoCondensedBold.copyWith(color: AppColors.redColor2, fontSize: 16),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
