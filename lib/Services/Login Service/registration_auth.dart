import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodpanda_clone/Model/user_model.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';

class RegistrationAuth {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> registrationInFirebase({
    required String userEmail,
    required String userPassword,
    required String userFirstName,
    required String userSecondName,
    required String userMobile,

}) async {
    print("1111");
    try{
      User? user = auth.currentUser;
      UserModel userModel = UserModel();
     dynamic reg = await auth.createUserWithEmailAndPassword(email: userEmail, password: userPassword).then((value) async {
        // writing all the values
        userModel.email = user!.email;
        userModel.uid = user.uid;
        userModel.firstName = userFirstName;
        userModel.secondName = userSecondName;
        userModel.mobileNumber = userMobile;

        await firebaseFireStore
            .collection("users")
            .doc(user.uid)
            .set(userModel.toMap());
        "Account created successful.. ".successSnackBar();
      }).catchError((error){
        error.toString().errorSnackBar();
      });
     "$reg".successSnackBar();
    } catch(e){
      e.toString().errorSnackBar();
    }



  }

}