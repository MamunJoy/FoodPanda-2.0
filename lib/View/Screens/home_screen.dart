import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Controller/home_controller.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:foodpanda_clone/Services/Storage%20Services/get_storage.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/View/Components/drawer.dart';
import 'package:foodpanda_clone/View/Components/home_card.dart';
import 'package:get/get.dart';
class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(foodPandaClone),
      ),
      body: Obx(() => controller.isLoading.value == true ? Center(child: SizedBox(width: 50,height: 50,child: defaultLoader(color: AppColors.primaryColor),).defaultContainer()) : CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                for(Map category in controller.categories)
                  ...[
                    HomeCard(itemName: "${category['itemName']}", itemAvailable: "${category['itemTypes']}", itemImage: "${category['imtemKey']}", onTap: (){
                      Get.toNamed(
                        Routes.item,
                        parameters: {
                          "itemKey":
                          "${category['imtemKey']}",
                          "itemName":
                          "${category['itemName']}",
                        },
                      )?.then((value) => controller.init());
                    })
                  ],
              ],
            ),
          ),
        ],
      )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
