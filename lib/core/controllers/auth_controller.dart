import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/login_screen.dart';
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

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => Get.offAll(HomeScreen()));
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
        .then((value) => Get.offAll(HomeScreen()));
  }

  Future signinwithEmail() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.offAll(HomeScreen()));
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

  Future signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(LoginScreen());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }
}
