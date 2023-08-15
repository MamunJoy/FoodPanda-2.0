import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Controller/item_controller.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/View/Components/item_card.dart';
import 'package:get/get.dart';

class ItemScreen extends GetWidget<ItemController> {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:  Obx(() => Text(controller.itemName.value)),
        // actions: [
        //   Stack(
        //     children: [
        //       IconButton(
        //         onPressed: () {
        //           Get.toNamed(Routes.cart)
        //               ?.then((value) => controller.init());
        //         },
        //         icon: const Icon(
        //           Icons.shopping_cart,
        //           size: 40,
        //         ),
        //       ),
        //       Obx(
        //             () => controller.cartItemList.isNotEmpty
        //             ? Positioned(
        //           top: 0.0,
        //           right: 8.0,
        //           child: Container(
        //             height: 20,
        //             width: 20,
        //             decoration: const BoxDecoration(
        //                 shape: BoxShape.circle, color: AppColors.green),
        //             child: Center(
        //               child: Text("${controller.cartItemList.length}",
        //                   style: AppTextTheme.text14),
        //             ),
        //           ),
        //         )
        //             : Container(),
        //       ),
        //     ],
        //   )
        // ],
      ),
      body: Obx(() => controller.isLoading.value == true
          ? Center(
              child: SizedBox(
              width: 50,
              height: 50,
              child: defaultLoader(color: AppColors.primaryColor),
            ).defaultContainer())
          : CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      for (Map item in controller.itemsList) ...[
                        ItemCard(
                          roteKey: controller.itemKey.value,
                          itemKey: "${item['itemKey']}",
                          itemName: "${item['itemName']}",
                          itemDescription: "${item['itemDescription']}",
                          itemQuantity: "${item['itemQuantity']}",
                          itemBasePrice: "${item['itemBasePrice']}",
                          onTap: () {
                            // Dialogs().addToCard( item: controller.itemList[index]);
                            // Get.toNamed(
                            //   Routes.addToCart,
                            //   parameters: {
                            //     "itemRoteKey": controller.itemKey.value,
                            //     "itemKey": "${item['itemKey']}",
                            //     "itemName": "${item['itemName']}",
                            //     "itemDescription": "${item['itemDescription']}",
                            //     "itemQuantity": "${item['itemQuantity']}",
                            //     "itemBasePrice": "${item['itemBasePrice']}",
                            //   },
                            // )?.then((value) => controller.init());
                          },
                        )
                      ],
                    ],
                  ),
                ),
              ],
            )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
