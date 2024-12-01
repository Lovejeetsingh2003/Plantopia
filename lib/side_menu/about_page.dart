import 'package:flutter/material.dart';

import '../colors.dart';
import '../main.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var aboutUs =
      "Welcome to Plantopia, your ultimate destination for a lush, green lifestyle. At Plantopia, we believe in the transformative power of plants to elevate your living and working spaces. Whether you’re a seasoned plant enthusiast or just beginning your journey, we’re here to guide and inspire you.\nOur platform offers a wide variety of indoor and outdoor plants, carefully curated to suit every preference and space. From low-maintenance succulents to vibrant flowering plants, we’ve got something for everyone.\nWhy Choose Plantopia?\n 1.Wide Selection: Explore an extensive range of plants for your home, garden, or office.\n 2.Quality Guaranteed: We ensure every plant reaches you healthy and ready to thrive.\n 3.Expert Guidance: Get tips and tricks for plant care from our community of experts.\n 4.Convenient Shopping: Browse, select, and have your greenery delivered right to your doorstep.\nAt Plantopia, we’re more than just an e-commerce platform; we’re a community of plant lovers dedicated to fostering a deeper connection with nature.\nJoin us on this green journey and let’s make the world a more beautiful place, one plant at a time! 🌱";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainTextColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              color: kButtonColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: kMainTextColor,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
        title: Text(
          "About Us",
          style: kLightAppThemeData.textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                aboutUs,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 20.0,
                  height: 25.0 / 15.0,
                  color: kBlackColor,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
