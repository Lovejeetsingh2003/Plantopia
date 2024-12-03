import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plantopia/cart/payment_page.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/config.dart';
import 'package:plantopia/main.dart';
import 'package:http/http.dart' as http;
import 'package:plantopia/objects/cart_object.dart';
import '../objects/product_object.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [];
  var quantity = 1;
  late double subTotal = 0.0;
  late double taxes = 5.0;
  late double deliveryCharges = 40.0;
  late double total = 0.0;
  var cartProductId = [];

  static getCart() async {
    List<CartObject> cart_object = [];
    try {
      final res = await http.get(
        Uri.parse(getCartProducts),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data['data'] != null && data['data'] is List) {
          data['data'].forEach((value) {
            cart_object.add(
              CartObject(
                id: value['_id'],
                quantity: value['quantity'],
                productId: value['product_id'],
              ),
            );
          });

          return cart_object;
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

  void deleteCartProducts(id) async {
    var body = {
      "_id": id,
    };
    try {
      var res = await http.post(
        Uri.parse(deleteCartProduct),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );

      if (res.statusCode == 200) {
        Fluttertoast.showToast(msg: "The Product successfully deleted");
        setState(() {});
      } else {
        Fluttertoast.showToast(msg: "Some error occur while deleting Product.");
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<Map<String, dynamic>> getCartAndProducts() async {
    var cart = await getCart();
    var product = await getProduct(cart);
    return {'cart': cart, 'product': product};
  }

  static Future<List<ProductObject>> getProduct(
      List<CartObject> cart_object) async {
    List<ProductObject> products = [];
    try {
      for (var cartProducts in cart_object) {
        var body = {"id": cartProducts.productId};
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

    setState(() {
      fetchData();
    });
  }

  // Bill Section

  double calculateSubTotal(List<Map<String, dynamic>> cartItems) {
    double subTotal = 0.0;
    for (var item in cartItems) {
      subTotal += item['price'] * item['quantity'];
    }
    return subTotal;
  }

  double calculateTaxes(double subTotal, double taxRate) {
    return subTotal * taxRate;
  }

  double calculateDeliveryCharges(double subTotal) {
    return subTotal > 1000 ? 0.0 : 40.0; // Free delivery for orders > 1000
  }

  double calculateTotal(
      double subTotal, double taxes, double deliveryCharges, double discount) {
    return subTotal + taxes + deliveryCharges - discount;
  }

  void fetchData() async {
    try {
      List<CartObject> cart = await getCart();
      List<ProductObject> products = await getProduct(cart);

      // Clear previous items to avoid duplicates
      cartItems.clear();

      // Add items to cart bill calculation
      for (int i = 0; i < cart.length; i++) {
        cartItems.add({
          'product_id': products[i].id,
          'price': products[i].productPrice,
          'quantity': cart[i].quantity,
        });
      }

      // Calculate totals
      subTotal = calculateSubTotal(cartItems);
      taxes = calculateTaxes(subTotal, taxRate);
      deliveryCharges = calculateDeliveryCharges(subTotal);
      total = calculateTotal(subTotal, taxes, deliveryCharges, discount);

      setState(() {});
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  double taxRate = 0.05; //  5% tax rate
  double discount = 0.0; //  discount

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
              FutureBuilder(
                future: getCartAndProducts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    List<ProductObject> list = snapshot.data!['product'];
                    List<CartObject> cartList = snapshot.data!['cart'];
                    return ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: false),
                      itemCount: list.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var product = list[index];
                        var cartData = cartList[index];
                        var image = product.productPic;
                        var firstName = product.productFirstName;
                        var lastName = product.productLastName;
                        var price = product.productPrice;

                        cartProductId.add(cartData.id);
                        print("CartId's : ${cartProductId}");
                        return Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 200,
                          decoration: const BoxDecoration(
                            color: kInvisibleGreenContainerColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //pic
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: image!.startsWith('http')
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
                                    ),
                                  ],
                                ),
                                //data
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                  size: 30,
                                                  color: kMainTextColor,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 40,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  color: kButtonColor,
                                                ),
                                                child: Text(
                                                  cartData.quantity.toString(),
                                                  style: kLightAppThemeData
                                                      .textTheme.titleSmall,
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
                                                  size: 30,
                                                  color: kMainTextColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //delete option
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          print(
                                              "cart Product id : ${cartData.id}");
                                          deleteCartProducts(cartData.id);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        size: 35,
                                        color: kMainTextColor,
                                      ),
                                    )
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

              //apply coupon
              GestureDetector(
                onTap: () {},
                child: Container(
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
                          "${subTotal.toString()}  Rs.",
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
                          "${discount.toString()}  Rs.",
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
                          "${deliveryCharges.toString()}  Rs.",
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
                          "${taxes.ceilToDouble().toString()}  Rs.",
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
                          "${total.ceilToDouble().toString()}  Rs.",
                          style: kLightAppThemeData.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ],
                ),
              ),

              //place order

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => PaymentPage(
                        cartProductId: cartProductId,
                      ),
                      transitionDuration: const Duration(seconds: 2),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
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
                        "Place Order",
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
