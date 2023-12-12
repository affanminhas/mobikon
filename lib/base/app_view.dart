import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/domain/bindings/global_bindings.dart';
import 'package:mobikon/presentation/splash/splash_view.dart';
import 'package:mobikon/route_generator.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GlobalBinding(),
      title: 'Mobikon App',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
