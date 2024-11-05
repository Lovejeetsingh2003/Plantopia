import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/main.dart';

class BottomSheetPage extends StatefulWidget {
  final product_First_Name;
  final product_Last_Name;
  final product_price;
  final product_desc;
  final product_pic;
  const BottomSheetPage(
      {required this.product_First_Name,
      required this.product_Last_Name,
      required this.product_desc,
      required this.product_pic,
      required this.product_price,
      super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  var quantity = 1;
  bool animate = false;

  void pop() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 500,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        border: Border(
            top: BorderSide(
          width: 2,
          color: Colors.black,
        )),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: widget.product_pic!.startsWith('http')
                      ? Image.network(
                          widget.product_pic,
                          height: 120,
                          width: 120,
                          fit: BoxFit.fitHeight,
                        )
                      : Image.memory(
                          base64Decode(
                            widget.product_pic,
                          ),
                          height: 120,
                          width: 120,
                          fit: BoxFit.fitHeight,
                        ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product_First_Name,
                      style: kDarkAppThemeData.textTheme.bodyMedium,
                    ),
                    Text(
                      widget.product_Last_Name,
                      style: kDarkAppThemeData.textTheme.bodyMedium,
                    ),
                    Text(
                      "₹${widget.product_price}",
                      style: kLightAppThemeData.textTheme.bodyMedium,
                    )
                  ],
                ),
              ],
            ),
            //Description
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                widget.product_desc,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: kMainTextColor),
              ),
            ),
            // quantity
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (quantity == 1) {
                          quantity = quantity;
                        } else {
                          quantity -= 1;
                        }
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 35,
                      color: kMainTextColor,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: kButtonColor,
                    ),
                    child: Text(
                      quantity.toString(),
                      style: kLightAppThemeData.textTheme.titleMedium,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity += 1;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 35,
                      color: kMainTextColor,
                    ),
                  )
                ],
              ),
            ),
            //add to cart
            GestureDetector(
              onTap: () {
                setState(() {
                  animate = true;
                });
                pop();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      repeat: false,
                      animate: animate,
                      frameRate: const FrameRate(80),
                      "assets/lottie/add_to_cart.json",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
