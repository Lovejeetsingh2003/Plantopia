import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 110, 67, 1),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: -40),
            child: const Image(
              image: AssetImage('assets/images/plant1.png'),
            ),
          ),
        ],
      ),
    );
  }
}
