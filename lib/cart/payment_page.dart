import 'package:flutter/material.dart';
import 'package:plantopia/cart/select_address_page.dart';
import '../colors.dart';
import '../main.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var isAddressPresent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Payment",
          style: kLightAppThemeData.textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.5,
              decoration: const BoxDecoration(
                color: kInvisibleGreenContainerColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Deliver To :",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const SelectAddressPage(),
                                transitionDuration: const Duration(seconds: 2),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                style: BorderStyle.solid,
                                color: kPrimaryColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              isAddressPresent == false
                                  ? "Add Address"
                                  : "Change",
                              style: kLightAppThemeData.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isAddressPresent == true
                      ? Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "No Address Present !",
                              style: kLightAppThemeData.textTheme.titleSmall,
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User Name",
                                textAlign: TextAlign.left,
                                style: kLightAppThemeData.textTheme.bodySmall,
                              ),
                              Text(
                                "Address",
                                textAlign: TextAlign.justify,
                                style: kLightAppThemeData.textTheme.bodyMedium,
                              ),
                              Text(
                                "Phone No.",
                                textAlign: TextAlign.justify,
                                style: kLightAppThemeData.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
