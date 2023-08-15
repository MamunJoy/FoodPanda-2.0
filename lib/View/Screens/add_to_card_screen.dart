
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:foodpanda_clone/Controller/add_to_card_controller.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class AddToCardScreen extends GetWidget<AddToCardController> {
  AddToCardScreen({super.key});
  final double height = Get.height;
  final double width = Get.width;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            addToCard,
          ),
        ),
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                selectImageFromLocal(
                  setImageMode("${AppImage.itemImagePath}/${controller.itemRoteKey.value}/${controller.itemKey.value}.png"),
                  height: 100,
                  width: width * 0.3,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  controller.itemName.value,
                  style: AppTextTheme.text14.copyWith(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.visible),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  controller.itemDescription.value,
                  style: AppTextTheme.text14.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.visible),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (width - defaultLeftRightPadding) * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Quantity : ",
                              style: AppTextTheme.text16,
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            SpinBox(
                              value: 0,
                              max: double.infinity,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                                ),
                              ),
                              onChanged: (double itemQuantity) {
                                controller.addItemQuantity(
                                    itemQTY: itemQuantity);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (width - defaultLeftRightPadding) * 0.05,
                      ),
                      SizedBox(
                        width: (width - defaultLeftRightPadding) * 0.55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price : ",
                              style: AppTextTheme.text16,
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            Obx(
                                  () => Text(
                                "CA\$${controller.itemTotalBasePrice}",
                                style: AppTextTheme.text18.copyWith(
                                    fontWeight: FontWeight.w800,
                                    overflow: TextOverflow.visible),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      AppColors.primaryColor, // Background color
                    ),
                    onPressed: () => controller.addItemInTable(),
                    child: Text(
                      "Add To Card",
                      style: AppTextTheme.text18.copyWith(
                          fontWeight: FontWeight.w800,
                          overflow: TextOverflow.visible,
                          color: AppColors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ).defaultContainer(),
          ),
        ),
      ),
    );
  }
}