import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInAuth {
  static Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: "Выполнено вход",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );
      print("Seccsesfull");
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
