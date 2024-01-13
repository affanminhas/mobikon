import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobikon/constants/strings.dart';

class PrimaryLoader extends StatelessWidget {
  const PrimaryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(Strings.loadingAnimation, width: 130, height: 130);
  }
}
