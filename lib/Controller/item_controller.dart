import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  final height = Get.height;
  final width = Get.width;

  RxBool isLoading = false.obs;

  RxList itemsList = [].obs;

  RxList cartItemList = [].obs;

  RxList allData = [].obs;

  RxString itemKey = "".obs;
  RxString itemName = "".obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    isLoading.value = true;
    await getDataFromWhileRoutingToItemScreen();
    await getDataFromFireStore();
    isLoading.value = false;
    update();
  }

  Future<void> getDataFromWhileRoutingToItemScreen() async {
    itemKey.value = Get.parameters['itemKey'] ?? "";
    itemName.value = Get.parameters['itemName'] ?? "";
    update();
  }
  // Future<void> getData() async {
  //   cartItemList.value = await ItemTable().getItemsListFromTable();
  // }
  Future<void> getDataFromFireStore() async {
    allData.value = [];
    itemsList.value = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(itemKey.value).get();
    allData.value = querySnapshot.docs.map((doc) => doc.data()).toList();
    itemsList.value = allData[0][itemKey.value];
    update();
  }

}