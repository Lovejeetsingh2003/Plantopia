import 'package:flutter/material.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/login_pages/login_page.dart';
import 'package:plantopia/main.dart';

class ForgetPswPage extends StatefulWidget {
  const ForgetPswPage({super.key});

  @override
  State<ForgetPswPage> createState() => _ForgetPswPageState();
}

class _ForgetPswPageState extends State<ForgetPswPage> {
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
            margin: const EdgeInsets.only(top: 50),
            child: Text(
              textAlign: TextAlign.center,
              "Forget Password",
              style: kLightAppThemeData.textTheme.titleMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextField(
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
          GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const LoginPage(),
                  transitionDuration: const Duration(seconds: 1),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.passthrough,
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: kOutlineColor,
                      ),
                      color: kButtonColor,
                    ),
                    margin: const EdgeInsets.only(top: 30),
                    width: 245,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Forget Password",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    right: -30,
                    top: 10,
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
        ],
      ),
    );
  }
}
