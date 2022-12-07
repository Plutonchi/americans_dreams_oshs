import 'package:american_dream_osh/service/reset_password.dart';
import 'package:american_dream_osh/presentasion/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../service/signin_service.dart';
import '../../widgets/login_widgets.dart';
import 'SignIn.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  controllers: _emailController,
                  hintText: "Email",
                  preffixIcon: Icons.email_outlined,
                  obscureText: false,
                  color: Color.fromARGB(192, 43, 43, 43),
                ),
                SizedBox(
                  height: 30,
                ),
                email_and_password(
                  controllers: _passwordController,
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
                  text: "Забыли Пароль?",
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPassword(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                logIn_button(
                    text: "Войти",
                    onPressed: () async {
                      await SignInAuth.signIn(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
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
