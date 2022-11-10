import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/login_widgets.dart';
import 'SignIn.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Image.asset(
                  "assets/images/unnamedd.jpg",
                  fit: BoxFit.cover,
                  width: 200,
                ),
                Text(
                  "Добро Пожаловать",
                  style: GoogleFonts.inter(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                email_and_password(
                  hintText: "Email",
                  preffixIcon: Icons.email_outlined,
                  obscureText: false,
                  color: Color.fromARGB(192, 43, 43, 43),
                ),
                SizedBox(
                  height: 30,
                ),
                email_and_password(
                  suffixIcon: Icons.visibility,
                  suffixIcons: Icons.visibility_off,
                  hintText: "Password",
                  preffixIcon: Icons.lock_outline,
                  color: Color.fromARGB(192, 43, 43, 43),
                  obscureText: true,
                ),
                SizedBox(
                  height: 15,
                ),
                forgot_and_register_password(
                    text: "Забыли Пароль?", onPressed: () {}),
                SizedBox(
                  height: 15,
                ),
                logIn_button(text: "Войти"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    forgot_and_register_password(
                      text: "Зарегистрироваться",
                      underlines: TextDecoration.underline,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SingIn()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
