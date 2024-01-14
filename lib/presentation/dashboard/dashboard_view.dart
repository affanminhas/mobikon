import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/drivers/drivers_view.dart';
import 'package:mobikon/presentation/home/home_controller.dart';
import 'package:mobikon/presentation/home/views/home_view.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';
import 'package:mobikon/presentation/my_account/views/my_account_view.dart';
import 'package:mobikon/presentation/products/controller/product_controller.dart';
import 'package:mobikon/presentation/products/views/products_view.dart';
import 'package:mobikon/presentation/report/view/report_view.dart';
import 'package:mobikon/presentation/stocks/controllers/stock_controller.dart';
import 'package:mobikon/presentation/stocks/views/stock_history_view.dart';

class DashboardView extends StatefulWidget {
  static const String id = '/dashboard-view';

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;
  List<Widget> screens = [];
  List<String> titles = [
    'Home',
    'Products',
    'Reports',
    'Stocks',
    'My Account',
  ];

  List<String> icons = [
    Strings.homeAsset,
    Strings.deliveriesAsset,
    Strings.reportAsset,
    Strings.stockAsset,
    Strings.myAccountAsset,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    screens = [
      HomeView(onMenuTap: _onItemTapped),
      const MyProductsView(),
      const ReportView(),
      const StockHistoryView(),
      const MyAccountView(),
    ];
    Get.find<ProfileController>().getUserProfileInfo();
    Get.find<ProfileController>().getUserBusinessInfo();
    Get.find<ProductController>().getAllProducts();
    Get.find<HomeController>().getContainerSize();
    Get.find<HomeController>().getAllContainers();
    Get.find<StockController>().getAllStockHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PopScope(
        canPop: false,
        child: Stack(
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
                      5,
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
      ),
    );
  }
}
