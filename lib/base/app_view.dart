import 'package:flutter/material.dart';
import 'package:mobikon/views/splash/splash_view.dart';
import 'package:mobikon/route_generator.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mobikon App',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
