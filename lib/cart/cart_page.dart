import 'package:flutter/material.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/main.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          height: 35,
          width: 35,
          decoration:
              const BoxDecoration(color: kButtonColor, shape: BoxShape.circle),
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: kMainTextColor,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
        title: Text(
          "Cart",
          style: kLightAppThemeData.textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text(
              textAlign: TextAlign.start,
              "Order & Pay",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
