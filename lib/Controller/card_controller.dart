import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Services/Storage%20Services/Local%20DB/item_table.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  RxBool isLoading = false.obs;

  RxDouble itemSubTotal = 0.0.obs;

  RxList itemsList = [].obs;


  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    itemSubTotal.value = 0.0;
    itemsList.value = await ItemTable().getItemsListFromTable();
    for (Map item in itemsList) {
      String price = item['itemTotalPrice'];
      itemSubTotal.value = itemSubTotal.value + double.parse(price);
    }
  }

  Future<void> updateItemQuantity(
      {required int itemIndex,
        required String itemID,
        required String updateType}) async {
    RxDouble quantity = 0.0.obs;
    RxDouble totalPrice = 0.0.obs;
    if (updateType == addItem) {
      quantity.value = double.parse(itemsList[itemIndex]['itemQuantity']) + 1;
    } else {
      quantity.value = double.parse(itemsList[itemIndex]['itemQuantity']) - 1;
    }
    totalPrice.value =
        quantity.value * double.parse(itemsList[itemIndex]['itemBasePrice']);
    if (quantity.value == 0) {
      await ItemTable().deleteItem(
          itemPrimeKey: itemsList[itemIndex]['primeKey'], idOfItem: itemID);
    } else {
      await ItemTable().updateItemQuantity(
          itemPrimeKey: itemsList[itemIndex]['primeKey'],
          idOfItem: itemID,
          quantityOfItem: "$quantity",
          totalPriceOfItem: "$totalPrice");
    }
    await init();
  }

  Future<void> deleteItemFromCart(
      {required int itemPrimeKey, required String itemID}) async {
    await ItemTable().deleteItem(itemPrimeKey: itemPrimeKey, idOfItem: itemID);
    await init();
  }

  Future<void> checkOut() async {
      await ItemTable().clearItemTable();
      Get.back();
      "Checkout Done".successSnackBar();

  }
}