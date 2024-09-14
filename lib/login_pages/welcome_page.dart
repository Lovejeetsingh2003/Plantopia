import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantopia/login_pages/login_page.dart';

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
      backgroundColor: const Color.fromRGBO(58, 110, 67, 1),
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/plant.png'),
          ),
          Text(
            textAlign: TextAlign.center,
            "Welcome \nTo \nPlantopia!",
            style: GoogleFonts.playfairDisplay(
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              textAlign: TextAlign.center,
              "Where Every Plant \nFind A Home",
              style: GoogleFonts.playfairDisplay(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
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
                        color: const Color.fromRGBO(255, 255, 255, 180),
                      ),
                      color: const Color.fromRGBO(255, 255, 255, 150),
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
