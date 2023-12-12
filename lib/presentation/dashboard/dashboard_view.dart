import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/deliveries/deliveries_view.dart';
import 'package:mobikon/presentation/drivers/drivers_view.dart';
import 'package:mobikon/presentation/home/home_view.dart';
import 'package:mobikon/presentation/my_account/my_account_view.dart';

class DashboardView extends StatefulWidget {
  static const String id = '/dashboard-view';

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const DeliveriesView(),
    const DriversView(),
    const MyAccountView(),
  ];
  List<String> titles = [
    'Home',
    'Deliveries',
    'Drivers',
    'My Account',
  ];

  List<String> icons = [
    Strings.homeAsset,
    Strings.deliveriesAsset,
    Strings.driversAsset,
    Strings.myAccountAsset,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          screens[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -1),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    4,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              icons[index],
                              width: 26,
                              height: 26,
                              color: _selectedIndex == index ? AppColors.primaryColor : AppColors.darkGrey,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              titles[index],
                              style: robotoCondensedMedium.copyWith(
                                fontSize: 12,
                                color: _selectedIndex == index ? AppColors.primaryColor : AppColors.darkGrey,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
