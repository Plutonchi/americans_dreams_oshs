import 'package:american_dream_osh/presentasion/page/home_page.dart';
import 'package:american_dream_osh/service/register_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/login_widgets.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                  "Зарегистрироваться",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                email_and_password(
                  controllers: emailController,
                  hintText: "Email",
                  preffixIcon: Icons.email_outlined,
                  obscureText: false,
                  color: Color.fromARGB(192, 43, 43, 43),
                ),
                SizedBox(
                  height: 30,
                ),
                email_and_password(
                  controllers: passwordController,
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
                logIn_button(
                    text: "Регистрация",
                    onPressed: () async {
                      await Register.register(
                          email: emailController.text,
                          password: passwordController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Есть аккаунт?",
                      style: TextStyle(fontSize: 15),
                    ),
                    forgot_and_register_password(
                      text: "Вход",
                      onPressed: () {
                        Navigator.pop(context);
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
