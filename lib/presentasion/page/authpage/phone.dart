import 'package:american_dream_osh/service/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Phone extends StatefulWidget {
  static String? verify;

  Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController countrycode = TextEditingController();
  @override
  PhoneCountryData? _initialCountryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/unnamedd.jpg",
                  width: 100,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Проверка Телефона",
                      style: GoogleFonts.lobster(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Hам нужно зарегистрировать ваш телефон, прежде чем приступить к работе!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ptSansNarrow(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        autocorrect: false,
                        controller: countrycode,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          countrycode.text = value;
                        },
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Номер",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: "+996 550 36 36 96",
                          verificationCompleted:
                              ((PhoneAuthCredential credential) {}),
                          timeout: Duration(seconds: 30),
                          verificationFailed: (FirebaseAuthException e) {
                            if (e.code == 'invalid-phone-number') {
                              Fluttertoast.showToast(
                                backgroundColor: Colors.transparent,
                                textColor: Colors.white,
                                gravity: ToastGravity.BOTTOM,
                                fontSize: 18,
                                timeInSecForIosWeb: 5,
                                toastLength: Toast.LENGTH_SHORT,
                                msg:
                                    "Oшибка! Указанный вами номер телефона недействителен",
                              );
                            } else {
                              Fluttertoast.showToast(
                                backgroundColor: Colors.transparent,
                                textColor: Colors.white,
                                gravity: ToastGravity.BOTTOM,
                                fontSize: 18,
                                timeInSecForIosWeb: 5,
                                toastLength: Toast.LENGTH_SHORT,
                                msg:
                                    "Ошибка Что-то пошло не так. Пробовать снова",
                              );
                            }
                            print("AAAAAAAAAAAAAAAAAAAA$e");
                          },
                          codeSent: (verificationId, forceResendingToken) {
                            Phone.verify = verificationId;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyVerify(),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (verificationId) {});
                    },
                    child: Text("Отправьте код")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
