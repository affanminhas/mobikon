import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/home/views/container/container_livefeed_view.dart';
import 'package:mobikon/presentation/home/views/container/request_container_view.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class ContainerDetailView extends StatelessWidget {
  static const String id = '/container-detail-view';

  const ContainerDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios_new, size: 18),
                      ),
                      const SizedBox(width: 16),
                      Text('Container #01', style: robotoCondensedBold.copyWith(fontSize: 18)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, RequestContainerView.id),
                        child: Text(
                          'Request Another Container',
                          style: robotoCondensedBold.copyWith(fontSize: 14, color: AppColors.blueColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Long press to ',
                          style: robotoCondensedRegular.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            height: 1.7,
                          ),
                        ),
                        TextSpan(
                          text: 'Add',
                          style: robotoCondensedMedium.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            height: 1.7,
                          ),
                        ),
                        TextSpan(
                          text: ' or ',
                          style: robotoCondensedRegular.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            height: 1.7,
                          ),
                        ),
                        TextSpan(
                          text: 'Reduce',
                          style: robotoCondensedMedium.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            height: 1.7,
                          ),
                        ),
                        TextSpan(
                          text: ' stock from shelves',
                          style: robotoCondensedRegular.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shelves', style: robotoCondensedBold.copyWith(fontSize: 18)),
                        Text(
                          'Available shelves in your selected container',
                          style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1.7,
                            ),
                            itemCount: 16,
                            itemBuilder: (context, index) {
                              return Container(
                                //margin: EdgeInsets.only(bottom: index == 15 ? 16 : 0),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                      offset: const Offset(2, 2),
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${index + 1}', style: robotoCondensedBold.copyWith(fontSize: 24)),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Image.asset(Strings.cubeIcon, height: 14, width: 14),
                                        const SizedBox(width: 4),
                                        Text(
                                          '6546 units stored',
                                          style: robotoCondensedRegular.copyWith(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        //const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      bgColor: AppColors.primaryColor,
                      onTap: () {
                        Navigator.pushNamed(context, ContainerLiveFeedView.id);
                      },
                      title: 'Check Live feed',
                      textStyle: robotoCondensedBold.copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      bgColor: AppColors.blueColor,
                      onTap: () {
                        //Navigator.pushNamed(context, RequestSubmittedView.id);
                      },
                      title: 'Track Container',
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
