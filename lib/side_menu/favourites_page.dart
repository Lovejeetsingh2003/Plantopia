import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plantopia/objects/favourite_products_object.dart';
import '../categories_pages/bottom_sheet_page.dart';
import '../colors.dart';
import '../config.dart';
import '../main.dart';
import '../main_pages/home_page.dart';
import '../objects/product_object.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  var list_length = 0;
  static getFavouriteProducts() async {
    List<FavouriteProductsObject> favourite_products_object = [];
    try {
      final res = await http.get(
        Uri.parse(getFavouriteProduct),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data['data'] != null && data['data'] is List) {
          data['data'].forEach(
            (value) {
              favourite_products_object.add(
                FavouriteProductsObject(
                  productId: value['product_id'],
                ),
              );
            },
          );

          return favourite_products_object;
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
      List<FavouriteProductsObject> favourite_products_object) async {
    List<ProductObject> products = [];
    try {
      for (var favourite in favourite_products_object) {
        var body = {"id": favourite.productId};
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
      List<FavouriteProductsObject> favorite = await getFavouriteProducts();
      // ignore: unused_local_variable
      List<ProductObject> products = await getProduct(favorite);

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
        centerTitle: true,
        title: Text(
          "Plantopia",
          style: kLightAppThemeData.textTheme.titleSmall,
        ),
        backgroundColor: kPrimaryColor,
        toolbarHeight: 60,
      ),
      body: CustomScrollView(
        slivers: [
          FutureBuilder(
            future: getFavouriteProducts().then((indoor) => getProduct(indoor)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                List<ProductObject> list = snapshot.data;
                list_length = list.length;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: list_length,
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
                            margin: const EdgeInsets.only(top: 20),
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
                                        showDragHandle: true,
                                        sheetAnimationStyle: AnimationStyle(
                                          reverseDuration:
                                              const Duration(seconds: 2),
                                          reverseCurve: Curves.bounceOut,
                                          curve: Curves.bounceIn,
                                          duration: const Duration(seconds: 2),
                                        ),
                                        enableDrag: true,
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
