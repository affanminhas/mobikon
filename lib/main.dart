import 'package:flutter/material.dart';
import 'package:mobikon/base/app_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobikon/services/preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.init();
  await dotenv.load(fileName: ".env");
  runApp(const AppView());
}
