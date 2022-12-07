import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register {
  static Future<dynamic> register({
    required String email,
    required String password,
  }) async {
    void sendVerificationEmail() async {
      final firebaseUser = await FirebaseAuth.instance.currentUser!;
      await firebaseUser.sendEmailVerification();
      Fluttertoast.showToast(
          msg:
              "Cсылка для проверки электронной почты отправлена на ваш электронный адрес.",
          timeInSecForIosWeb: 5,
          toastLength: Toast.LENGTH_LONG);
    }

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => sendVerificationEmail());

      print("Seccsesfull");
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        Fluttertoast.showToast(
          msg: e.message.toString(),
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          toastLength: Toast.LENGTH_LONG,
        );
        print("Password low ");
        Fluttertoast.showToast(
          msg: e.message.toString(),
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          toastLength: Toast.LENGTH_LONG,
        );
      } else if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(
          msg: e.message.toString(),
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          toastLength: Toast.LENGTH_LONG,
        );
        print("Email change");
      } else {
        Fluttertoast.showToast(
          msg: e.message.toString(),
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          toastLength: Toast.LENGTH_LONG,
        );
        print(e.code);
      }
    }
  }
}
