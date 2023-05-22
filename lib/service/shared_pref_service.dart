import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../common/shared_code.dart';
import '../model/auth/login_success_model.dart';

class SharedPreferencesService {
  static Future<SharedPreferences> get _instance async =>
      prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences? prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    prefs = await _instance;
    return prefs ?? await SharedPreferences.getInstance();
  }

  static Future<void> setAuthModel(LoginSuccessModel authModel) async {
    await prefs?.setString(SharedCode.authJson, jsonEncode(authModel.toJson()));
  }

  static LoginSuccessModel? getAuthModel() {
    String? authJson = prefs?.getString(SharedCode.authJson);
    if (authJson != null) {
      LoginSuccessModel authModel = loginSuccessModelFromJson(authJson);
      return authModel;
    }
    return null;
  }
}
