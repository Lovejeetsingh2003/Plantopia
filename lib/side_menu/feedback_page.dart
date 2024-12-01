import 'package:flutter/material.dart';
import 'package:plantopia/colors.dart';

import '../main.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController feedbackController = TextEditingController();
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
          "FeedBack",
          style: kLightAppThemeData.textTheme.titleSmall,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Give Your Feedback If You Want Anything Need To Change in Our Services.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20.0,
                height: 25.0 / 15.0,
                color: kPrimaryColor,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: feedbackController,
              maxLines: 8,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: kOutlineColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: "Give You Feedback",
                hintStyle: TextStyle(
                  height: 12.0 / 8.0,
                  fontSize: 15,
                  color: kGreyColor,
                  letterSpacing: 0.5,
                ),
              ),
              keyboardType: TextInputType.name,
              style: const TextStyle(
                height: 12.0 / 8.0,
                fontSize: 15,
                color: kBlackColor,
                letterSpacing: 0.5,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              height: 60,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Submit Feedback",
                    style: kLightAppThemeData.textTheme.titleSmall,
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
