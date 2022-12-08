import 'package:american_dream_osh/presentasion/page/authpage/LogIn.dart';
import 'package:american_dream_osh/presentasion/page/home_page.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../presentasion/page/authpage/SignIn.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Ошибка"),
            );
          } else {
            return LogIn();
          }
        },
      ),
    );
  }
}
