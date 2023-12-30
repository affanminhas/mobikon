import 'package:flutter/material.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/widgets/custom_appbar.dart';

class SlideDoorFeedView extends StatelessWidget {
  static const String id = '/slide-door-feed-view';

  const SlideDoorFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryAppBar(title: 'Side Door Feed'),
            ),
            const SizedBox(height: 10),
            Image.asset(Strings.cameraSlide),
          ],
        ),
      ),
    );
  }
}
