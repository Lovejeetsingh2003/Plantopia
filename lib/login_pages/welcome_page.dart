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
          Stack(
            children: [
              Positioned(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 40),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 150),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 20),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Get Start",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: -5,
                top: 0,
                child: Image(
                  width: 100,
                  height: 100,
                  image: AssetImage('assets/images/plant2.png'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
