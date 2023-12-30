import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/app_views/approval_view.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class BusinessSuccessView extends StatelessWidget {
  static const String id = '/businessSuccessView';

  const BusinessSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 36),
                Image.asset(Strings.verifiedLogo, width: 100, height: 100),
                const SizedBox(height: 32),
                Text(
                  'Business Registered Successfully',
                  style: robotoCondensedBold.copyWith(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Your business has been registered and created successfully. Now you can navigate to Home and start using IRT',
                  style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                PrimaryButton(
                  title: 'Get Started',
                  bgColor: AppColors.primaryColor,
                  onTap: () => Navigator.pushNamed(context, ApprovalView.id),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
