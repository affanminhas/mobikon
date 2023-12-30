import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';

class NotificationView extends StatelessWidget {
  static const String id = '/notificationView';

  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new_outlined, size: 18),
                  ),
                  const SizedBox(width: 8),
                  Text('Notifications', style: robotoCondensedBold.copyWith(fontSize: 18)),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('In App Notifications', style: robotoCondensedBold.copyWith(fontSize: 18)),
                        Text(
                          'Manage all your app notifications from here',
                          style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 10,
                    child: Switch(
                      value: true,
                      activeColor: AppColors.mintGreen,
                      thumbColor: MaterialStateProperty.all(Colors.white),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
