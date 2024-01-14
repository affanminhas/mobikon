import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';

class NotificationView extends StatelessWidget {
  static const String id = '/notification-view';

  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  Text('Notifications', style: robotoCondensedBold.copyWith(fontSize: 18)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Ceramic Processor CPU ',
                                      style: robotoCondensedBold.copyWith(
                                        fontSize: 16,
                                        color: AppColors.black1,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Your PO Request has been accepted by IRT buyer',
                                      style: robotoCondensedRegular.copyWith(
                                        fontSize: 16,
                                        color: AppColors.black1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '1 day ago',
                                style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 30),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
