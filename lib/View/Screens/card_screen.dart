import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Controller/card_controller.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class CardScreen extends GetWidget<CardController> {
  CardScreen({super.key});

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
            child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (int index = 0;
                index < controller.itemsList.length;
                index++) ...[
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Center(
                              child: Icon(Icons.shopping_cart,
                                  size: defaultIconSize)),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          SizedBox(
                            width: (Get.width -
                                defaultIconSize -
                                defaultLeftRightPadding) *
                                0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.itemsList[index]['itemName']}",
                                  style: AppTextTheme.text14,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "${controller.itemsList[index]['itemDescription']}",
                                  style: AppTextTheme.text14,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          SizedBox(
                            width: width * 0.08,
                            child: IconButton(
                              onPressed: () {
                                controller.updateItemQuantity(
                                    itemIndex: index,
                                    itemID: controller.itemsList[index]
                                    ['itemId'] ??
                                        "",
                                    updateType: addItem);
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          SizedBox(
                            width: width * 0.1,
                            child: Center(
                              child: Text(
                                "${controller.itemsList[index]['itemQuantity']}",
                                textAlign: TextAlign.center,
                                style: AppTextTheme.text14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          SizedBox(
                            width: width * 0.08,
                            child: IconButton(
                              onPressed: () {
                                controller.updateItemQuantity(
                                    itemIndex: index,
                                    itemID: controller.itemsList[index]
                                    ['itemId'] ??
                                        "",
                                    updateType: removeItem);
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          SizedBox(
                            width: width * 0.08,
                            child: IconButton(
                              onPressed: () {
                                controller.deleteItemFromCart(
                                    itemPrimeKey: controller
                                        .itemsList[index]['primeKey'],
                                    itemID: controller.itemsList[index]
                                    ['itemId'] ??
                                        "");
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ).defaultContainer(
                          backgroundColor:
                          AppColors.primaryColor.withOpacity(0.5)),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  )
                ],
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: Text(
                    "SubTotal : \$${controller.itemSubTotal}",
                    style: AppTextTheme.text16
                        .copyWith(overflow: TextOverflow.visible),
                  ),
                ).defaultContainer(
                    backgroundColor: AppColors.greyOpacity04),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      AppColors.primaryColor, // Background color
                    ),
                    onPressed: () {
                      controller.checkOut();
                    },
                    child: Text(
                      "Check Out",
                      style: AppTextTheme.text18.copyWith(
                          fontWeight: FontWeight.w800,
                          overflow: TextOverflow.visible,
                          color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ).defaultContainer()),
          ),
        ),
      ),
    );
  }
}