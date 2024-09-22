import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/config.dart';
import 'package:plantopia/login_pages/login_page.dart';
import 'package:plantopia/main.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPswTextController = TextEditingController();

  void signUpClick() async {
    if (emailTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty &&
        confirmPswTextController.text.isNotEmpty &&
        passwordTextController.text == confirmPswTextController.text) {
      var regBody = {
        "email": emailTextController.text,
        "password": passwordTextController.text
      };

      try {
        var response = await http.post(
          Uri.parse(signUpApi),
          body: jsonEncode(regBody),
          headers: {"Content-Type": "application/json"},
        );

        if (response.statusCode == 200) {
          var message = jsonDecode(response.body);
          print("Message: $message");
          Fluttertoast.showToast(msg: "Sign Up Successful");
          Navigator.pop(context);
        } else {
          Fluttertoast.showToast(msg: "Error: ${response.reasonPhrase}");
        }
      } catch (e) {
        print("error: $e");
      }
    } else {
      Fluttertoast.showToast(msg: "some error occured");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/plant.png'),
          ),
          Text(
            textAlign: TextAlign.center,
            "Plantopia!",
            style: kLightAppThemeData.textTheme.titleLarge,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: emailTextController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: kOutlineColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                hintText: "Enter Your Email",
                hintStyle: kLightAppThemeData.textTheme.bodyMedium,
              ),
              keyboardType: TextInputType.emailAddress,
              style: kLightAppThemeData.textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              obscureText: true,
              controller: passwordTextController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: kOutlineColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                hintText: "Enter Your Password",
                hintStyle: kLightAppThemeData.textTheme.bodyMedium,
              ),
              style: kLightAppThemeData.textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              obscureText: true,
              controller: confirmPswTextController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: kOutlineColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                hintText: "Confirm Password",
                hintStyle: kLightAppThemeData.textTheme.bodyMedium,
              ),
              style: kLightAppThemeData.textTheme.bodyMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              signUpClick();
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.passthrough,
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: kOutlineColor,
                      ),
                      color: kButtonColor,
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    width: 200,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "SignUp",
                          style: kLightAppThemeData.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    right: -30,
                    top: -10,
                    child: Image(
                      width: 100,
                      height: 100,
                      image: AssetImage('assets/images/plant2.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have An Account?",
                  style: kLightAppThemeData.textTheme.bodySmall,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const LoginPage(),
                        transitionDuration: const Duration(seconds: 2),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      "Login",
                      style: kDarkAppThemeData.textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
