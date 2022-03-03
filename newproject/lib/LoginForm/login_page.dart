import 'package:flutter/material.dart';

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
        appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: const CustomText(text: "Login")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "Enter UserName",
                  ),
                  CustomTextfield(hintText: "Username", controller: userName),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(text: "Enter Password"),
                  CustomTextfield(
                      hintText: "Password", controller: userPassword),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (userName.text.isNotEmpty) {
                            print("clicked");
                          }
                        },
                        child: const Text("Login")),
                  )
                ],
              )),
        ));
  }
}

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty) {
            print("Must not be Empty");
          }
        },
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black38,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            hintText: hintText,
            constraints: const BoxConstraints(
                maxHeight: 50, minHeight: 35, maxWidth: 400, minWidth: 200)),
      ),
    );
  }
}
