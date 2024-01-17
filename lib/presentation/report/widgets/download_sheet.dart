import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class PDFDownloadSheet extends StatefulWidget {
  final String title;

  const PDFDownloadSheet({
    super.key,
    required this.title,
  });

  @override
  State<PDFDownloadSheet> createState() => _PDFDownloadSheetState();
}

class _PDFDownloadSheetState extends State<PDFDownloadSheet> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? selectedStartDate : selectedEndDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? selectedStartDate : selectedEndDate)) {
      setState(() {
        isStartDate ? selectedStartDate = picked : selectedEndDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.lightGrey3,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.title,
            style: robotoCondensedBold.copyWith(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Start Date', style: robotoCondensedBold.copyWith(fontSize: 18)),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: const Icon(
                            Icons.calendar_today_outlined,
                            size: 18,
                            color: AppColors.blueColor,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      DateFormat.yMMMMEEEEd().format(selectedStartDate),
                      style: robotoCondensedRegular.copyWith(
                        fontSize: 14,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('End Date', style: robotoCondensedBold.copyWith(fontSize: 18)),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: const Icon(
                            Icons.calendar_today_outlined,
                            size: 18,
                            color: AppColors.blueColor,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      DateFormat.yMMMMEEEEd().format(selectedEndDate),
                      style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          SecondaryButton(
            bgColor: AppColors.blueColor,
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.download, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  'Download PDF',
                  style: robotoCondensedBold.copyWith(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
