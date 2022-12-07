import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../presentasion/page/authpage/SignIn.dart';

class Register {
  static Future<dynamic> register({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

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
