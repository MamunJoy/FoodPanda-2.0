import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Services/Login%20Service/registration_auth.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  // form key
  final registrationFormKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController firstNameEditingController =
      TextEditingController();

  final TextEditingController secondNameEditingController =
      TextEditingController();

  final TextEditingController mobileNumberEditingController =
      TextEditingController();

  final TextEditingController emailEditingController = TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();

  final TextEditingController confirmPasswordEditingController =
      TextEditingController();

  RxBool checkedValue = false.obs;
  RxBool checkboxValue = false.obs;

  RxBool isSigningUp = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {}

  Future<void> signUp() async {
    isSigningUp.value = true;
    if (registrationFormKey.currentState!.validate()) {

      if (passwordEditingController.text ==
          confirmPasswordEditingController.text) {
       await RegistrationAuth().registrationInFirebase(
          userEmail: emailEditingController.text,
          userPassword: passwordEditingController.text,
          userFirstName: firstNameEditingController.text,
          userSecondName: secondNameEditingController.text,
          userMobile: mobileNumberEditingController.text,
        );
       Get.offAllNamed(Routes.login);
      }else{
        "Password and Confirm Password didn't match".errorSnackBar();
      }

    }
    isSigningUp.value = false;
  }
}
