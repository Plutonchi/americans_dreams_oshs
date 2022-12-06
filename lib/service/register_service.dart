import 'package:firebase_auth/firebase_auth.dart';

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
        print("Password low ");
      } else if (e.code == "email-already-in-use") {
        print("Email change");
      } else {
        print(e.code);
      }
    }
  }
}
