import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodpanda_clone/Model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final height = Get.height;
  final width = Get.width;
  CollectionReference categoryCollection =
  FirebaseFirestore.instance.collection('itemCategorys');

  CollectionReference userCollection =
  FirebaseFirestore.instance.collection('itemCategorys');
  RxBool isLoading = false.obs;

  RxList categories = [].obs;
  RxList allData = [].obs;

  UserModel? loggedInUser = UserModel();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    isLoading.value = true;
    allData.value = [];
    categories.value = [];
    QuerySnapshot querySnapshot = await categoryCollection.get();
    allData.value = querySnapshot.docs.map((doc) => doc.data()).toList();
    categories.value = allData[0]['categorys'];
    isLoading.value = false;

  }

}