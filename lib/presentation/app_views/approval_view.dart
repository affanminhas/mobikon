import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/welcome/welcome_view.dart';
import 'package:mobikon/services/preferences.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class ApprovalView extends StatefulWidget {
  static const String id = 'login_approval_view';

  const ApprovalView({super.key});

  @override
  State<ApprovalView> createState() => _ApprovalViewState();
}

class _ApprovalViewState extends State<ApprovalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 36),
                Image.asset(Strings.approvalClock, width: 100, height: 100),
                const SizedBox(height: 32),
                Text(
                  'Waiting For Approval',
                  style: robotoCondensedBold.copyWith(fontSize: 25),
                ),
                const SizedBox(height: 8),
                Text(
                  'You need to wait for the approval or you can logout of your account',
                  style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                PrimaryButton(
                  title: '',
                  bgColor: AppColors.redColor,
                  disabledColor: AppColors.primaryColor50,
                  onTap: () async {
                    await Preference.clear();
                    if (mounted) {
                      Navigator.pushNamedAndRemoveUntil(context, WelcomeView.id, (route) => false);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.logout, color: AppColors.bgColor),
                      const SizedBox(width: 8),
                      Text(
                        'Logout',
                        style: robotoCondensedBold.copyWith(fontSize: 16, color: AppColors.bgColor),
                      ),
                    ],
                  ),
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
