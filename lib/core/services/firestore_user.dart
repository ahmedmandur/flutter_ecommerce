import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/auth/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future addUser(UserModel userModel) async {
    return await _userCollection.doc(userModel.userId).set(userModel.toJson());
  }
}
