import 'package:flutter/material.dart';
import 'package:newproject/home_screen/home_screen.dart';
import 'package:newproject/utility/utility.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const CustomText(
                    text: "Login",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    text: "Please sign in to continue",
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextfield(
                      prefixIcon: emailIcon,
                      hintText: emailLabelText,

                      //  errorText: emailError,
                      controller: userName),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                      prefixIcon: passIcon,
                      hintText: passwordHintText,
                      // errorText: passworderror,
                      controller: userPassword),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginButton(
                    onPressed: () {
                      if (userName.text.isNotEmpty &&
                          userPassword.text.isNotEmpty) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // const Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Text("Don't have an account?"),
                  // ),
                ],
              ),
            )),
      ),
    ));
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({Key? key, required this.onPressed}) : super(key: key);
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed(),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 130,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
                colors: [Colors.orange, Colors.deepOrange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.arrow_forward,
                size: 29.0,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key, required this.text, required this.fontSize, this.fontWeight})
      : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {Key? key,
      required this.controller,
      this.prefixIcon,
      this.errorText,
      this.hintText})
      : super(key: key);
  final String? hintText;
  final String? errorText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 2.0,
        child: TextFormField(
          validator: (value) {
            if (value == null && value!.isNotEmpty) {
              return "Can't be Empty";
            }
          },
          controller: controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              focusColor: iconColor,
              prefixIcon: prefixIcon,
              prefixIconColor: iconColor,
              labelStyle: const TextStyle(fontWeight: FontWeight.w900),
              filled: false,
              fillColor: Colors.black38,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              labelText: hintText,
              constraints: const BoxConstraints(
                  maxHeight: 80, minHeight: 35, maxWidth: 400, minWidth: 200)),
        ),
      ),
    );
  }
}
