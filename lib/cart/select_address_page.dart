import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plantopia/cart/add_address_page.dart';
import 'package:plantopia/config.dart';
import 'package:plantopia/objects/address_object.dart';
import 'package:http/http.dart' as http;
import '../colors.dart';
import '../main.dart';

class SelectAddressPage extends StatefulWidget {
  const SelectAddressPage({super.key});

  @override
  State<SelectAddressPage> createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
  var list_length;
  static Future<List<AddressObject>> getAddress() async {
    List<AddressObject> address = [];
    try {
      final res = await http.get(
        Uri.parse(getAddressApi),
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data['data'] != null && data['data'] is List) {
          data['data'].forEach((value) {
            address.add(
              AddressObject(
                id: value['_id'],
                username: value['username'] ?? 'Unknown',
                phoneNo: value['phone_no'] ?? 'Unknown',
                alternatePhoneNo: value['alternate_phone_no'] ?? 'Unknown',
                pincode: value['pincode'] ?? 'Unknown',
                state: value['state'] ?? 'Unknown',
                city: value['city'] ?? 'Unknown',
                houseNo: value['house_no'] ?? 'Unknown',
                area: value['area'] ?? 'Unknown',
                nearbyLandmark: value['nearby_landmark'] ?? 'Unknown',
                addressType: value['address_type'] ?? 'Unknown',
              ),
            );
          });
          return address;
        } else {
          print("No address data found");
          return [];
        }
      } else {
        print("Failed to load address data. Status code: ${res.statusCode}");
        return [];
      }
    } catch (e) {
      print("error : $e");
      return [];
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
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Text(
          "Select Address",
          style: kLightAppThemeData.textTheme.titleSmall,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const AddAddressPage(),
                          transitionDuration: const Duration(seconds: 2),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
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
                          const Icon(
                            Icons.add,
                            size: 30,
                            color: kMainTextColor,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Add New Address",
                              style: kLightAppThemeData.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder(
            future: getAddress(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                List<AddressObject> list = snapshot.data;
                list_length = list.length;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: list_length,
                    (BuildContext context, int index) {
                      var address = list[index];
                      var username = address.username;
                      var houseNo = address.houseNo;
                      var phoneNo = address.phoneNo;
                      var landmark = address.nearbyLandmark;
                      var area = address.area;
                      var city = address.city;
                      var state = address.state;
                      var pincode = address.pincode;
                      var addressType = address.addressType;
                      return Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.width / 1.5,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            style: BorderStyle.solid,
                            color: kPrimaryColor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: kInvisibleGreenContainerColor,
                        ),
                        child: Row(
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_box_outline_blank,
                                  size: 30,
                                  color: kPrimaryColor,
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          username.toString(),
                                          style: kLightAppThemeData
                                              .textTheme.bodySmall,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 10,
                                        ),
                                        color: kPrimaryColor,
                                        child: Text(
                                          addressType.toString(),
                                          style: kLightAppThemeData
                                              .textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Text(
                                      "${houseNo.toString()}-${area.toString()},${landmark.toString()},${city.toString()},\n${state.toString()} - ${pincode.toString()}",
                                      style: kLightAppThemeData
                                          .textTheme.bodySmall,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      textAlign: TextAlign.left,
                                      phoneNo.toString(),
                                      style: kLightAppThemeData
                                          .textTheme.bodySmall,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 15),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Edit Details",
                                            style: kLightAppThemeData
                                                .textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
