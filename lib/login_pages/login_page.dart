import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantopia/login_pages/forget_psw_page.dart';
import 'package:plantopia/login_pages/signup_page.dart';
import 'package:plantopia/login_pages/welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(58, 110, 67, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/plant.png'),
          ),
          Text(
            textAlign: TextAlign.center,
            "Plantopia!",
            style: GoogleFonts.playfairDisplay(
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                hintText: "Enter Your Email",
                hintStyle: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                hintText: "Enter Your Password",
                hintStyle: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const ForgetPswPage(),
                  transitionDuration: const Duration(seconds: 2),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                    top: 10,
                  ),
                  child: Text(
                    textAlign: TextAlign.end,
                    "Forget Password?",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const WelcomePage(),
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
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(255, 255, 255, 180),
                      ),
                      color: const Color.fromRGBO(255, 255, 255, 150),
                    ),
                    margin: const EdgeInsets.only(top: 30),
                    width: 220,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Does'nt Have Any Account?",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const SignupPage(),
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
                      "SignUp",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        color: const Color.fromRGBO(227, 220, 165, 1),
                        fontWeight: FontWeight.normal,
                      ),
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
