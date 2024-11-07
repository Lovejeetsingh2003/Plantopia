import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plantopia/cart/cart_page.dart';
import 'package:plantopia/categories_pages/all_types_page.dart';
import 'package:plantopia/categories_pages/indoor_plants_page.dart';
import 'package:plantopia/categories_pages/outdoor_plants_page.dart';
import 'package:plantopia/categories_pages/top_picks_pages.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/config.dart';
import 'package:plantopia/main.dart';
import 'package:plantopia/main_pages/side_menu.dart';
import 'package:plantopia/objects/product_object.dart';
import 'package:plantopia/objects/recommended_object.dart';
import 'package:http/http.dart' as http;
import '../categories_pages/bottom_sheet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  static getRecommended() async {
    List<RecommendedObject> recommended = [];
    try {
      final res = await http.get(
        Uri.parse(getRecommendedApi),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data['data'] != null && data['data'] is List) {
          data['data'].forEach((value) {
            recommended.add(
              RecommendedObject(
                id: value['_id'],
                productId: value['product_id'],
              ),
            );
          });

          return recommended;
        } else {
          print("No products found");
          return [];
        }
      } else {
        print(
            "Failed Recommended to load products. Status code: ${res.statusCode}");
        return [];
      }
    } catch (e) {
      print("error : $e");
      return [];
    }
  }

  static Future<List<ProductObject>> getProduct(
      List<RecommendedObject> recommended_list) async {
    List<ProductObject> products = [];
    try {
      for (var recommended in recommended_list) {
        var body = {"id": recommended.productId};
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
      List<RecommendedObject> topPicks = await getRecommended();

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
      key: scaffoldKey,
      drawer: const SideMenu(),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const CartPage(),
                        transitionDuration: const Duration(seconds: 2),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      color: kButtonColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shopping_bag,
                      size: 30,
                      color: kMainTextColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    size: 30,
                    color: kMainTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
        title: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            "Plantopia",
            style: kLightAppThemeData.textTheme.titleSmall,
          ),
        ),
        backgroundColor: kPrimaryColor,
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(
                    60,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    //app bar finished
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Top Picks
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      const TopPicksPages(),
                                  transitionDuration:
                                      const Duration(seconds: 2),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.35,
                              height: 210,
                              decoration: const BoxDecoration(
                                color: kButtonColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.3,
                                          image: const AssetImage(
                                              "assets/images/plant1.png"))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Top\nPicks",
                                          style: kLightAppThemeData
                                              .textTheme.titleSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Outdoor Plants
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      const OutdoorPlantsPage(),
                                  transitionDuration:
                                      const Duration(seconds: 2),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.35,
                              height: 210,
                              decoration: const BoxDecoration(
                                color: kButtonColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Outdoor\nPlants",
                                          style: kLightAppThemeData
                                              .textTheme.titleSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: 120,
                                        image: const AssetImage(
                                            "assets/images/plant3.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Indoor Plants
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                const IndoorPlantsPage(),
                            transitionDuration: const Duration(seconds: 2),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.35,
                              height: 210,
                              decoration: const BoxDecoration(
                                color: kButtonColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Indoor\nPlants",
                                          style: kLightAppThemeData
                                              .textTheme.titleSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: 120,
                                        image: const AssetImage(
                                            "assets/images/plant4.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //All Types
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const AllTypesPage(),
                                    transitionDuration:
                                        const Duration(seconds: 2),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.35,
                                height: 210,
                                decoration: const BoxDecoration(
                                  color: kButtonColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.3,
                                            image: const AssetImage(
                                                "assets/images/plant5.png"))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "All\nTypes",
                                            style: kLightAppThemeData
                                                .textTheme.titleSmall,
                                          ),
                                        ],
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
                  ],
                ),
              ),
            ),
            //Recomended Section
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  child: const Text("RECOMMENDED",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        letterSpacing: 0.5,
                      )),
                ),
              ],
            ),

            //Reconmmended Grid
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: 250,
              child: FutureBuilder(
                future: getRecommended()
                    .then((recommended) => getProduct(recommended)),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<ProductObject> list = snapshot.data;
                    return ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var product = list[index];
                        var image = product.productPic;
                        var firstName = product.productFirstName;
                        var lastName = product.productLastName;
                        var price = product.productPrice;
                        return Container(
                          margin: const EdgeInsets.all(10),
                          height: 250,
                          width: 250,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: kInvisibleGreenContainerColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                image!.startsWith('http')
                                    ? Image.network(
                                        image,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fitHeight,
                                      )
                                    : Image.memory(
                                        base64Decode(image),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      firstName ?? "unknown",
                                      style: kLightAppThemeData
                                          .textTheme.bodyMedium,
                                    ),
                                    Text(
                                      lastName ?? "unknown",
                                      style: kLightAppThemeData
                                          .textTheme.bodyMedium,
                                    ),
                                    Text(
                                      '₹$price',
                                      style: kLightAppThemeData
                                          .textTheme.bodySmall,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showBottomSheet(
                                          sheetAnimationStyle: AnimationStyle(
                                            reverseDuration:
                                                const Duration(seconds: 2),
                                            reverseCurve: Curves.bounceOut,
                                            curve: Curves.bounceIn,
                                            duration:
                                                const Duration(seconds: 2),
                                          ),
                                          enableDrag: true,
                                          showDragHandle: true,
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
                                              product_price:
                                                  product.productPrice,
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 130,
                                        decoration: const BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "Add To Cart",
                                          style: kLightAppThemeData
                                              .textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),

            //Recommended end
          ],
        ),
      ),
    );
  }
}
