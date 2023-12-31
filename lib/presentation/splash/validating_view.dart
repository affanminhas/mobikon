import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/presentation/login/login_controller.dart';
import 'package:mobikon/widgets/custom_loaders.dart';

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
        child: PrimaryLoader(),
      ),
    );
  }
}
