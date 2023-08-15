import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Services/Login%20Service/login_auth.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginController extends GetxController {
  // form key
  final formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  RxBool isSigning = false.obs;

  @override
  void onInit() {
    // init();
    super.onInit();
  }

  Future<void> init() async {
    if (!await requestPermission(Permission.storage)) {
      await requestPermission(Permission.storage);
    }
  }

  Future<void> signIn() async {
    isSigning.value = true;
    if (formKey.currentState!.validate()) {
      await LoginAuth().signIn(email:emailController.text, password: passwordController.text);
    }
    isSigning.value = false;
  }
  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if (result == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
      }
    }
    return false;
  }

}