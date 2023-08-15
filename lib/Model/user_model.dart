class UserModel{
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? mobileNumber;

  UserModel({this.uid,this.email, this.firstName, this.secondName, this.mobileNumber});

  //receiving data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      mobileNumber: map['mobileNumber'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'mobileNumber': mobileNumber,
    };
  }


}