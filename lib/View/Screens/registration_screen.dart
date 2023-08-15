import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Controller/registration_controller.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/View/Components/core_flat_button.dart';
import 'package:foodpanda_clone/View/Components/core_textField.dart';
import 'package:foodpanda_clone/View/WIdgets/header_widget.dart';
import 'package:get/get.dart';

class RegistrationScreen extends GetWidget<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Column(
              children: [
                Form(
                  key: controller.registrationFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 150),
                      Text('Registration',style: AppTextTheme.text18,),
                      const SizedBox(height: 30),
                      CoreTextField(
                        labelText: 'First Name',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.firstNameEditingController,
                        validator: AuthValidator.nameValidator,
                      ),
                      const SizedBox(height: 30),
                      CoreTextField(
                        labelText: 'Last Name',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.secondNameEditingController,
                        validator: AuthValidator.nameValidator,
                      ),
                      const SizedBox(height: 20.0),
                      CoreTextField(
                        labelText: 'Mobile Number',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.mobileNumberEditingController,
                        validator: AuthValidator.phoneValidator,
                      ),
                      const SizedBox(height: 20.0),
                      CoreTextField(
                        labelText: 'E-mail address',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailEditingController,
                        validator: AuthValidator.emailValidator,
                      ),
                      const SizedBox(height: 20.0),
                      CoreTextField(
                        labelText: 'Password',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.passwordEditingController,
                        validator: AuthValidator.passwordValidator,
                      ),
                      const SizedBox(height: 20.0),
                      CoreTextField(
                        labelText: 'Confirm Password',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.confirmPasswordEditingController,
                        validator: AuthValidator.passwordValidator,
                      ),
                      const SizedBox(height: 15.0),
                      FormField<bool>(
                        builder: (state) {
                          return Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: controller.checkboxValue.value,
                                    onChanged: (value) {
                                      controller.checkboxValue.value = value!;
                                      state.didChange(value);
                                    },
                                  ),
                                  Text(
                                    "I accept all terms and conditions.",
                                    style: AppTextTheme.text16,
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  state.errorText ?? '',
                                  textAlign: TextAlign.left,
                                  style: AppTextTheme.text14.copyWith(color: AppColors.redAccent),
                                ),
                              )
                            ],
                          ).paddingOnly(left: 20,right: 20);
                        },
                        validator: (value) {
                          if (!controller.checkboxValue.value) {
                            return 'You need to accept terms and conditions';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      Obx(() => CoreFlatButton(
                        text: 'Register'.toUpperCase(),
                        isGradientBg: true,
                        onPressed: controller.signUp,
                        isLoading: controller.isSigningUp.value,
                      ).paddingSymmetric(horizontal: 17)),
                    ],
                  ).paddingAll(20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
