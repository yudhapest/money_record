import 'dart:convert';

import 'package:get/get.dart';
import 'package:money_record/controller/user_controller.dart';
import 'package:money_record/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<bool> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool succes = await pref.setString('user', stringUser);
    if (succes) {
      final userController = Get.put(UserController());
      userController.setData(user);
    }
    return succes;
  }

  static Future<User> getUser() async {
    User user = User(); //default value
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    final userController = Get.put(UserController());
    userController.setData(user);
    return user;
  }

  static Future<bool> deleteUser() async {
    final pref = await SharedPreferences.getInstance();
    bool succes = await pref.remove('user');
    final userController = Get.put(UserController());
    userController.setData(User());
    return succes;
  }
}
