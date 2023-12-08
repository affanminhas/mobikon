import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class WelcomeView extends StatelessWidget {
  static const String id = 'welcome_view';

  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            Strings.welcomeBg,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Get started in only a few minutes',
                  style: robotoCondensedRegular.copyWith(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Place To Keep Your Goods Safe',
                  style: robotoCondensedBold.copyWith(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PrimaryButton(
                    title: 'Create Account',
                    textStyle: robotoCondensedBold.copyWith(fontSize: 18, color: Colors.white),
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 16),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: robotoCondensedBold.copyWith(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 58),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By continuing, you agree to our app’s ',
                          style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey, height: 1.7),
                        ),
                        TextSpan(
                          text: 'Terms Of Service ',
                          style: robotoCondensedMedium.copyWith(fontSize: 14, color: Colors.white, height: 1.7),
                        ),
                        TextSpan(
                          text: 'and acknowledge that you’ve read our ',
                          style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey, height: 1.7),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: robotoCondensedMedium.copyWith(fontSize: 14, color: Colors.white, height: 1.7),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 31),
              ],
            ),
          )
        ],
      ),
    );
  }
}
