import 'package:flutter/material.dart';

class email_and_password extends StatefulWidget {
  final String hintText;
  final IconData preffixIcon;
  final IconData? suffixIcon;
  final IconData? suffixIcons;
  TextEditingController? controllers;

  bool obscureText = false;
  Color? color;

  email_and_password({
    Key? key,
    this.controllers,
    required this.hintText,
    this.suffixIcon,
    this.suffixIcons,
    this.color,
    required this.preffixIcon,
    required this.obscureText,
  }) : super(key: key);
 

  @override
  State<email_and_password> createState() => _email_and_passwordState();
}

class _email_and_passwordState extends State<email_and_password> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controllers,
      obscureText: widget.obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          prefixIcon: Icon(
            widget.preffixIcon,
            color: widget.color,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
            child: Icon(
              widget.obscureText ? widget.suffixIcon : widget.suffixIcons,
              color: Colors.grey,
            ),
          )),
    );
  }
}

class forgot_and_register_password extends StatelessWidget {
  final String? text;
  VoidCallback? onPressed;
  TextDecoration? underlines;
  forgot_and_register_password({
    Key? key,
    this.text,
    this.onPressed,
    this.underlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text(
            "$text",
            style: TextStyle(
              decoration: underlines,
              fontSize: 15,
              color: Colors.black,
              letterSpacing: 0.7,
            ),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              // foregroundColor: Colors.black,
              shape: StadiumBorder()),
        ),
      ],
    );
  }
}

class logIn_button extends StatelessWidget {
  String? text;
  Function()? onPressed;
  logIn_button({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          "$text",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 55, 186, 173),
          onPrimary: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
