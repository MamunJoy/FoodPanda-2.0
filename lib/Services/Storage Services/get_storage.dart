import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Model/user_model.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get_storage/get_storage.dart';

class GSServices {
  GSServices._();
  static final GetStorage _userGS = GetStorage('user');

  static Future<void> initialize() async {
    await GetStorage.init('locale');
    await GetStorage.init('user');
  }

  static Future<void> setUser({required UserModel user}) async {
    await _userGS.write('user', jsonEncode(user));
    debugPrint("<--- Local User Updated => ${getUser.toString()} --->");
  }

  static UserModel? get getUser => isNullEmptyOrFalse(_userGS.read('user'))
      ? null
      : jsonDecode(_userGS.read('user'));

  static Future<void> clearLocalStorage() async {
    await _userGS.erase();
  }
}