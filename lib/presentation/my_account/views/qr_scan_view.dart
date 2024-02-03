import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/model/profile_model.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';
import 'package:mobikon/widgets/custom_appbar.dart';
import 'package:mobikon/widgets/custom_image_builder.dart';

class QRScanView extends StatelessWidget {
  static const String id = '/qr-scan-view';

  const QRScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProfileController>(
          builder: (profileController) {
            UserProfile profile = profileController.profile;
            return Column(
              children: [
                const SizedBox(height: 24),
                const PrimaryAppBar(title: 'Short link QR'),
                const SizedBox(height: 150),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Container(
                          width: 300,
                          height: 320,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey4,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 40),
                              Text(
                                '${profile.firstName} ${profile.lastName}',
                                style: robotoCondensedBold.copyWith(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              CustomCashedImage(
                                image: Endpoints.baseUrl + profile.qrCode,
                                shape: BoxShape.rectangle,
                                width: 200,
                                height: 200,
                              ),
                              const SizedBox(height: 10),
                              Text('Scan QR Code', style: robotoCondensedRegular)
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: CustomCashedImage(image: Endpoints.baseUrl + profile.profilePicture),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
