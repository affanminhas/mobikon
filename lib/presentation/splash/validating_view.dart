import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/presentation/login/login_controller.dart';

class ValidatingView extends StatefulWidget {
  static const String id = 'validating_view';

  const ValidatingView({super.key});

  @override
  State<ValidatingView> createState() => _ValidatingViewState();
}

class _ValidatingViewState extends State<ValidatingView> {
  @override
  void initState() {
    super.initState();
    Get.find<LoginController>().checkUserRegistration();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
    );
  }
}
