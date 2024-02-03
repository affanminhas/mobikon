import 'package:flutter/material.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/presentation/home/views/container/slide_door_feed_view.dart';
import 'package:mobikon/widgets/custom_appbar.dart';

class ContainerLiveFeedView extends StatelessWidget {
  static const String id = '/container-livefeed-view';

  const ContainerLiveFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const PrimaryAppBar(title: 'Container #01 Live Feed'),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SlideDoorFeedView.id);
              },
              child: Image.asset(
                Strings.cameraView,
                fit: BoxFit.fitWidth,
                width: double.infinity,
                height: 200,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, SlideDoorFeedView.id),
                    child: Image.asset(
                      Strings.cameraView,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 100,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, SlideDoorFeedView.id),
                    child: Image.asset(
                      Strings.cameraView,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 100,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
