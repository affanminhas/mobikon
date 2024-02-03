import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/widgets/custom_appbar.dart';

class NotificationControlView extends StatelessWidget {
  static const String id = '/notificationView';

  const NotificationControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const PrimaryAppBar(title: 'Notifications'),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
