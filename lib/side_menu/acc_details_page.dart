import 'package:flutter/material.dart';
import '../colors.dart';
import '../main.dart';

class AccDetailsPage extends StatefulWidget {
  const AccDetailsPage({super.key});

  @override
  State<AccDetailsPage> createState() => _AccDetailsPageState();
}

class _AccDetailsPageState extends State<AccDetailsPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController gender = TextEditingController();
  var has_data = true;

  // void updateProduct() async {

  //     var productBody = {
  //       "_id": widget.id,
  //       "product_pic": base64StringForUpdate,
  //       "product_first_name": plantFirstNameController.text,
  //       "product_last_name": plantLastNameController.text,
  //       "product_desc": plantDescController.text,
  //       "product_price": plantPriceController.text,
  //       "product_type": plant_type == 0 ? "Indoor Plant" : "Outdoor Plant",
  //       "is_instock": 0,
  //     };

  //     try {
  //       var response = await http.post(
  //         Uri.parse(updateProductAPi),
  //         body: jsonEncode(productBody),
  //         headers: {"Content-Type": "application/json; charset=UTF-8"},
  //       );

  //       if (response.statusCode == 200) {
  //         var message = jsonDecode(response.body);
  //         print("Message: $message");
  //         Fluttertoast.showToast(msg: "Product Updated Successful");
  //         Navigator.pop(context);
  //       } else {
  //         print("Error : ${response.body}");
  //       }
  //     } catch (e) {
  //       print("error: $e");
  //     }

  // }

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
          "Account Details",
          style: kLightAppThemeData.textTheme.titleSmall,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Name :",
                    style: TextStyle(
                      height: 20.0 / 10.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    child: TextField(
                      controller: username,
                      enabled: has_data == true ? false : true,
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
                        hintText: "Username",
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Email :",
                    style: TextStyle(
                      height: 20.0 / 10.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    child: TextField(
                      controller: email,
                      enabled: has_data == true ? false : true,
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
                        hintText: "Email",
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Mobile No. :",
                    style: TextStyle(
                      height: 20.0 / 10.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    child: TextField(
                      controller: mobileNo,
                      enabled: has_data == true ? false : true,
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
                        hintText: "Not Specified",
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Gender :",
                    style: TextStyle(
                      height: 20.0 / 10.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    child: TextField(
                      enabled: has_data == true ? false : true,
                      controller: gender,
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
                        hintText: "Not Specified",
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
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (has_data == true) {
                    has_data = false;
                  } else {
                    has_data = true;
                  }
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width / 1.5,
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
                      has_data == true ? "Edit Details" : "Save Details",
                      style: kLightAppThemeData.textTheme.titleSmall,
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
