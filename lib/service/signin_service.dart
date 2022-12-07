import 'package:american_dream_osh/presentasion/page/authpage/LogIn.dart';
import 'package:american_dream_osh/presentasion/page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        msg: "Выполнено вход",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
      );
      print("Seccsesfull");
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
