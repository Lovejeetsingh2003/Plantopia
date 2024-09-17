import 'package:flutter/material.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/login_pages/login_page.dart';
import 'package:plantopia/main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
            "Welcome \nTo \nPlantopia!",
            style: kLightAppThemeData.textTheme.titleLarge,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              textAlign: TextAlign.center,
              "Where Every Plant \nFind A Home",
              style: kLightAppThemeData.textTheme.bodyLarge,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
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
                    width: 220,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Get Start",
                          style: kLightAppThemeData.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    left: -30,
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
          )
        ],
      ),
    );
  }
}
