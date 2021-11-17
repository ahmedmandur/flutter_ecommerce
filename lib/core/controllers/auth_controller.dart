import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/services/firestore_user.dart';
import 'package:ecommerce/models/auth/user_model.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  String email = "", password = "", name = "";
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _user = Rxn<User>();
  get user => _user.value?.email;

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      saveUser(user).then((value) => Get.offAll(() => HomeScreen()));
    });
  }

  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((user) {
      saveUser(user).then((value) => Get.offAll(() => HomeScreen()));
    });
  }

  Future signinwithEmail() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.offAll(() => HomeScreen());
      });
    } on FirebaseAuthException catch (e) {
      print(e);

      Get.snackbar(
        "Error",
        "Error happened during login!",
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  Future signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        saveUser(value).then((value) {
          Get.offAll(() => HomeScreen());
          Get.snackbar(
            "Success",
            "User Registered Successfully!",
            icon: Icon(Icons.check, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: PRIMARY_COLOR,
            borderRadius: 20,
            margin: EdgeInsets.all(15),
            colorText: Colors.white,
            duration: Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: SnackDismissDirection.HORIZONTAL,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        });
      });
    } on FirebaseAuthException catch (e) {
      print(e);

      Get.snackbar(
        "Error",
        "Error happened during registration!",
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future saveUser(UserCredential user) async {
    await FireStoreUser().addUser(UserModel(
        email: user.user!.email,
        name: name.isEmpty ? user.user!.displayName : name,
        userId: user.user!.uid,
        pic: user.user!.photoURL));
  }

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }
}
