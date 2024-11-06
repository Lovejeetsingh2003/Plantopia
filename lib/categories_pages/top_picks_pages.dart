import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plantopia/categories_pages/bottom_sheet_page.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/config.dart';
import 'package:plantopia/main.dart';
import 'package:plantopia/main_pages/home_page.dart';
import 'package:plantopia/objects/product_object.dart';
import 'package:plantopia/objects/top_pick_object.dart';
import 'package:http/http.dart' as http;

class TopPicksPages extends StatefulWidget {
  const TopPicksPages({super.key});

  @override
  State<TopPicksPages> createState() => _TopPicksPagesState();
}

class _TopPicksPagesState extends State<TopPicksPages> {
  static getTopPicks() async {
    List<TopPickObject> top_picks = [];
    try {
      final res = await http.get(
        Uri.parse(getTopPickApi),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data['data'] != null && data['data'] is List) {
          data['data'].forEach((value) {
            top_picks.add(
              TopPickObject(
                id: value['_id'],
                productId: value['product_id'],
              ),
            );
          });

          return top_picks;
        } else {
          print("No products found");
          return [];
        }
      } else {
        print(
            "Failed top pick to load products. Status code: ${res.statusCode}");
        return [];
      }
    } catch (e) {
      print("error : $e");
      return [];
    }
  }

  static Future<List<ProductObject>> getProduct(
      List<TopPickObject> top_picks) async {
    List<ProductObject> products = [];
    try {
      for (var topPick in top_picks) {
        var body = {"id": topPick.productId};
        var res = await http.post(
          Uri.parse(getProductByIdApi),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json; charset=UTF-8"},
        );

        if (res.statusCode == 200) {
          var data = jsonDecode(res.body);

          if (data['data'] != null && data['data'] is List) {
            data['data'].forEach((value) {
              products.add(
                ProductObject(
                  id: value['_id'],
                  productFirstName: value['product_first_name'] ?? 'Unknown',
                  productLastName: value['product_last_name'] ?? 'Unknown',
                  productDesc: value['product_desc'] ?? 'No description',
                  productPrice: value['product_price'] ?? 0,
                  productPic: value['product_pic'] ?? '',
                  productType: value['product_type'] ?? 'Unknown',
                  isInstock: value['is_instock'] ?? false,
                ),
              );
            });
          }
        } else {
          print(
              "Failed to load product details. Status code: ${res.statusCode}");
        }
      }

      return products;
    } catch (e) {
      print("Error fetching product details: $e");
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      List<TopPickObject> topPicks = await getTopPicks();
      // ignore: unused_local_variable
      List<ProductObject> products = await getProduct(topPicks);

      setState(() {});
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const HomePage(),
                transitionDuration: const Duration(seconds: 1),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 30,
            color: kMainTextColor,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 30,
                    color: kMainTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
        title: Text(
          "Plantopia",
          style: kLightAppThemeData.textTheme.titleSmall,
        ),
        backgroundColor: kPrimaryColor,
        toolbarHeight: 60,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            pinned: false,
            centerTitle: false,
            stretch: true,
            expandedHeight: 320.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Container(
                height: 320,
                width: MediaQuery.of(context).size.width,
                color: kPrimaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Top\nPicks",
                        style: kDarkAppThemeData.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: const Image(
                        width: 220,
                        image: AssetImage(
                          "assets/images/plant1.png",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kWhiteColor,
            elevation: 0,
            pinned: true,
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(20), child: SizedBox()),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 0,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "16",
                            style: kLightAppThemeData.textTheme.bodySmall,
                          ),
                        ),
                        const Text(
                          "All",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 110,
                    top: 0,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: kGreyColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "6",
                            style: kLightAppThemeData.textTheme.bodyMedium,
                          ),
                        ),
                        const Text(
                          "Outdoor",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 250,
                    top: 0,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: kGreyColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "10",
                            style: kLightAppThemeData.textTheme.bodyMedium,
                          ),
                        ),
                        const Text(
                          "Indoor",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder(
            future: getTopPicks().then((topPicks) => getProduct(topPicks)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                List<ProductObject> list = snapshot.data;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: list.length,
                    (BuildContext context, int index) {
                      var product = list[index];
                      var image = product.productPic;
                      var firstName = product.productFirstName;
                      var lastName = product.productLastName;
                      var price = product.productPrice;
                      return Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 150,
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              ),
                            ),
                            child: Container(
                              padding: lastName != ""
                                  ? const EdgeInsets.only(left: 20)
                                  : const EdgeInsets.only(
                                      top: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        firstName ?? 'Unknown',
                                        style: kDarkAppThemeData
                                            .textTheme.titleSmall,
                                      ),
                                      lastName != ""
                                          ? Text(
                                              lastName ?? 'Unknown',
                                              style: kDarkAppThemeData
                                                  .textTheme.titleSmall,
                                            )
                                          : const SizedBox(),
                                      Text(
                                        '₹$price',
                                        style: kLightAppThemeData
                                            .textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return BottomSheetPage(
                                            productId: product.id,
                                            product_First_Name:
                                                product.productFirstName,
                                            product_Last_Name:
                                                product.productLastName,
                                            product_desc: product.productDesc,
                                            product_pic: product.productPic,
                                            product_price: product.productPrice,
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 60,
                                      decoration: const BoxDecoration(
                                        color: kButtonColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 45,
                                        color: kMainTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 35,
                            child: image!.startsWith('http')
                                ? Image.network(
                                    image,
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.fitHeight,
                                  )
                                : Image.memory(
                                    base64Decode(image),
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.fitHeight,
                                  ),
                          ),
                        ],
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
