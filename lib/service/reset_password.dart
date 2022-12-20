import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../presentasion/widgets/login_widgets.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text)
          .then(
            (value) => Navigator.pop(context),
          );
      Fluttertoast.showToast(
          backgroundColor: Colors.transparent,
          textColor: Colors.white,
          fontSize: 18,
          msg:
              "Отправлено ссылку для сброса пароля! Проверьте свою электронную",
          timeInSecForIosWeb: 4,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(
        backgroundColor: Colors.transparent,
        textColor: Colors.white,
        fontSize: 18,
        msg: e.message.toString(),
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Bведите свой адрес электронной почты, и мы вышлем вам ссылку для сброса пароля",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Email",
                  fillColor: Colors.grey[200],
                  filled: true),
            ),
            SizedBox(
              height: 10,
            ),
            logIn_button(
              onPressed: passwordReset,
              text: "Сброс Пароля",
            ),
          ],
        ),
      ),
    );
  }
}
