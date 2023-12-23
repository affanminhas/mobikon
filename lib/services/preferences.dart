import 'dart:convert';
import 'dart:developer';

import 'package:mobikon/domain/auth_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _Key {
  static const String accessToken = 'accessToken';
  static const String refreshAccessToken = 'refreshAccessToken';
  static const String appLanguage = 'appLanguage';
  static Map<String, dynamic> defaultValues = {
    _Key.accessToken: '',
    _Key.refreshAccessToken: '',
    _Key.appLanguage: '',
  };
}

class Preference {
  static final Preference _preference = Preference._();

  factory Preference() => _preference;

  Preference._();

  static late final SharedPreferences _instance;
  static final String tokenInitialValue = _Key.defaultValues[_Key.accessToken];
  static final String refreshTokenInitialValue = _Key.defaultValues[_Key.refreshAccessToken];
  static final String appLanguageInitialValue = _Key.defaultValues[_Key.appLanguage];

  static const themeStatus = "THEMESTATUS";
  static const String _userKey = "user-key";

  static bool get isTokenAvailable => accessToken.isNotEmpty;

  static Future<void> init() async {
    try {
      _instance = await SharedPreferences.getInstance();
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }

  static AuthDataModel get signUpModel => AuthDataModel.fromMap(jsonDecode(_instance.getString(_userKey)!));

  static Future<bool> saveAuthDataModel(AuthDataModel model) async {
    log('saving signup model: ${model.toMap()}');
    try {
      bool isSaved = await _instance.setString(_userKey, jsonEncode(model.toMap()));
      setAccessToken(model.access);
      return isSaved;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static String get accessToken {
    return _instance.getString(_Key.accessToken) ?? tokenInitialValue;
  }

  static Future setAccessToken(String accessToken) async {
    log('set Access accessToken: $accessToken');
    await _instance.setString(_Key.accessToken, accessToken);
  }

  static String get refreshAccessToken {
    return _instance.getString(_Key.refreshAccessToken) ?? refreshTokenInitialValue;
  }

  static Future setRefreshAccessToken(String refreshAccessToken) async {
    await _instance.setString(_Key.refreshAccessToken, refreshAccessToken);
  }

  static String get appLanguage {
    return _instance.getString(_Key.appLanguage) ?? appLanguageInitialValue;
  }

  static Future setAppLanguage(String appLanguage) async {
    await _instance.setString(_Key.appLanguage, appLanguage);
  }

  static Future setDarkTheme(bool value) async {
    _instance.setBool(themeStatus, value);
  }

  /// Dark Theme Preferences
  /// Boolean property here showing either dark mode enable or not
  static Future<bool> get getDarkTheme async {
    return _instance.getBool(themeStatus) ?? false;
  }

  static Future<bool> clear() async {
    return await _instance.clear();
  }
}
