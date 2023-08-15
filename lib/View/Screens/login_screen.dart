import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Controller/login_controller.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/View/Components/core_flat_button.dart';
import 'package:foodpanda_clone/View/Components/core_textField.dart';
import 'package:foodpanda_clone/View/WIdgets/header_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  final double _headerHeight = 250;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoreTextField(
                      labelText: 'Email',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: AuthValidator.emailValidator,
                      prefixIcon: AppIcons.email,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CoreTextField(
                      labelText: 'Password',
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      controller: controller.passwordController,
                      validator: AuthValidator.passwordValidator,
                      prefixIcon: AppIcons.password,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => CoreFlatButton(
                      text: 'Sign In'.toUpperCase(),
                      isGradientBg: true,
                      onPressed: controller.signIn,
                      isLoading: controller.isSigning.value,
                    ).paddingSymmetric(horizontal: 17),),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text.rich(TextSpan(children: [
                        TextSpan(text: "Don't have an account? ",style: AppTextTheme.text18),
                        TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            Get.toNamed(Routes.registration);
                            },
                          style: AppTextTheme.text22.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w800),
                        ),
                      ])).defaultContainer(backgroundColor: AppColors.backgroundColor),
                    ),
                  ],
                )).defaultContainer(backgroundColor: AppColors.backgroundColor),
          ],
        ),
      ),
    );
  }
}
