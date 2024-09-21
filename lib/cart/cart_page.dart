import 'package:flutter/material.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/main.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                color: kButtonColor, shape: BoxShape.circle),
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
          "Cart",
          style: kLightAppThemeData.textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              // cart list
              ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(keepScrollOffset: false),
                itemCount: 2,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 200,
                    decoration: const BoxDecoration(
                      color: kInvisibleGreenContainerColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: Image(
                            image: AssetImage("assets/images/plant2.png"),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Echeveria\nElegans",
                                  style:
                                      kLightAppThemeData.textTheme.titleSmall,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: kMainTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "580.00 Rs.",
                              style: kLightAppThemeData.textTheme.bodyMedium,
                            ),
                            Row(
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
                                    size: 25,
                                    color: kMainTextColor,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: kButtonColor,
                                  ),
                                  child: Text(
                                    quantity.toString(),
                                    style:
                                        kLightAppThemeData.textTheme.titleSmall,
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
                                    size: 25,
                                    color: kMainTextColor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              //apply coupon
              Container(
                margin: const EdgeInsets.only(top: 20),
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
                    const Image(
                      height: 30,
                      width: 30,
                      image: AssetImage("assets/images/discount.png"),
                    ),
                    Text(
                      "Apply Coupon",
                      style: kLightAppThemeData.textTheme.titleSmall,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: kMainTextColor,
                    )
                  ],
                ),
              ),

              //Bill detail
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  textAlign: TextAlign.start,
                  "Bill Detail",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 200,
                decoration: const BoxDecoration(
                  color: kInvisibleGreenContainerColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        ),
                        Text(
                          "1550.00 Rs.",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        ),
                        Text(
                          "0.00 Rs.",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dilivery charges",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        ),
                        Text(
                          "40.00 Rs.",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Taxes",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        ),
                        Text(
                          "77.5 Rs.",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const Divider(
                      height: 1,
                      color: kMainTextColor,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        ),
                        Text(
                          "1667.5 Rs.",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // order confirm
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
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
                      "Confirm Order",
                      style: kLightAppThemeData.textTheme.titleSmall,
                    ),
                    const Icon(
                      Icons.local_shipping,
                      size: 50,
                      color: kMainTextColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
