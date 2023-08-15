import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  checkLogin() async {
    Timer(
      const Duration(seconds: 0),
          () => Get.offAllNamed(Routes.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: selectImageFromLocal(
        setImageMode(AppImage.splash),
      ),
    );
  }
}
