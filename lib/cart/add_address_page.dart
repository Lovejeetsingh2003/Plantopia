import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:plantopia/config.dart';
import '../colors.dart';
import '../main.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController nearbyLandmark = TextEditingController();

  var addAlternatePhoneNo = false;
  var type = 0;
  var addresstype = "";

  void addProduct() async {
    if (userName.text.isNotEmpty &&
        phoneNo.text.isNotEmpty &&
        pinCode.text.isNotEmpty &&
        state.text.isNotEmpty &&
        city.text.isNotEmpty &&
        houseNo.text.isNotEmpty &&
        area.text.isNotEmpty &&
        addresstype.isNotEmpty) {
      var addressBody = {
        "username": userName.text,
        "phone_no": phoneNo.text,
        "pincode": pinCode.text,
        "state": state.text,
        "city": city.text,
        "house_no": houseNo.text,
        "area": area.text,
        "address_type": addresstype,
      };

      try {
        var response = await http.post(
          Uri.parse(addAddressApi),
          body: jsonEncode(addressBody),
          headers: {"Content-Type": "application/json; charset=UTF-8"},
        );

        if (response.statusCode == 200) {
          var message = jsonDecode(response.body);
          print("Message: $message");
          Fluttertoast.showToast(msg: "Address Added Successful");
          Navigator.pop(context);
        } else {
          print("Error : ${response.body}");
        }
      } catch (e) {
        print("error: $e");
      }
    } else {
      Fluttertoast.showToast(msg: "some error occured or select all fields.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Add Address",
          style: kLightAppThemeData.textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //personal details
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: userName,
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
                    hintText: "Full Name (Required)*",
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
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: phoneNo,
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
                    hintText: "Phone No. (Required)*",
                    hintStyle: TextStyle(
                      height: 12.0 / 8.0,
                      fontSize: 15,
                      color: kGreyColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    height: 12.0 / 8.0,
                    fontSize: 15,
                    color: kBlackColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              addAlternatePhoneNo == true
                  ? Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: phoneNo,
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
                          hintText: "Another Phone No.",
                          hintStyle: TextStyle(
                            height: 12.0 / 8.0,
                            fontSize: 15,
                            color: kGreyColor,
                            letterSpacing: 0.5,
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          height: 12.0 / 8.0,
                          fontSize: 15,
                          color: kBlackColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    )
                  : Container(),

              GestureDetector(
                onTap: () {
                  setState(() {
                    if (addAlternatePhoneNo == false) {
                      addAlternatePhoneNo = true;
                    } else {
                      addAlternatePhoneNo = false;
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    border: Border.all(
                      width: 2,
                      style: BorderStyle.solid,
                      color: kPrimaryColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        addAlternatePhoneNo == false ? Icons.add : Icons.remove,
                        size: 30,
                        color: kMainTextColor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          addAlternatePhoneNo == false
                              ? "Add Alternate Phone No."
                              : "No Need To Add.",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // address
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: TextField(
                      controller: pinCode,
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
                        hintText: "Pincode (Required)*",
                        hintStyle: TextStyle(
                          height: 12.0 / 8.0,
                          fontSize: 15,
                          color: kGreyColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        height: 12.0 / 8.0,
                        fontSize: 15,
                        color: kBlackColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    margin: const EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: state,
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
                        hintText: "State (Required)*",
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
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: TextField(
                      controller: city,
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
                        hintText: "City (Required)*",
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
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: houseNo,
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
                    hintText: "House No., Building Name (Required)*",
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
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: area,
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
                    hintText: "Road Name, Area, Colony (Required)*",
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
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: nearbyLandmark,
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
                    hintText: "Nearby Landmark",
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
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "Type Of Address",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 25.0 / 15.0,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type = 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: type == 1 ? kPrimaryColor : kMainTextColor,
                          border: Border.all(
                              width: 2,
                              color: kPrimaryColor,
                              style: BorderStyle.solid),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.home,
                              color: type == 1 ? kMainTextColor : kPrimaryColor,
                              size: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Home",
                                style: TextStyle(
                                  height: 12.0 / 8.0,
                                  fontSize: 15,
                                  color: type == 1
                                      ? kMainTextColor
                                      : kPrimaryColor,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type = 2;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: type == 2 ? kPrimaryColor : kMainTextColor,
                          border: Border.all(
                            width: 2,
                            color: kPrimaryColor,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.work,
                              color: type == 2 ? kMainTextColor : kPrimaryColor,
                              size: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Work",
                                style: TextStyle(
                                  height: 12.0 / 8.0,
                                  fontSize: 15,
                                  color: type == 2
                                      ? kMainTextColor
                                      : kPrimaryColor,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // if (widget.id != null &&
                  //     widget.desc != null &&
                  //     widget.firstName != null &&
                  //     widget.lastName != null &&
                  //     widget.pic != null &&
                  //     widget.price != null &&
                  //     widget.type != null) {
                  //   updateProduct();
                  // } else {

                  if (type == 1) {
                    addresstype = "Home";
                  } else if (type == 2) {
                    addresstype = "Work";
                  } else {
                    addresstype = "Unknown";
                  }
                  addProduct();
                  // }
                },
                child: Container(
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
                        "Add Address",
                        style: kLightAppThemeData.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
