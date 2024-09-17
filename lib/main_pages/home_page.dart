import 'package:flutter/material.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  onTap: () {},
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
                  onTap: () {},
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
                            onTap: () {},
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
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
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
                            onTap: () {},
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
                      onTap: () {},
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
                              onTap: () {},
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
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
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
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
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
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            width: 100,
                            image: AssetImage("assets/images/plant2.png"),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Echeveria\nElegans",
                                style: kLightAppThemeData.textTheme.titleSmall,
                              ),
                              Text(
                                "580.00 Rs.",
                                style: kLightAppThemeData.textTheme.bodyMedium,
                              ),
                              Container(
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
                                  style: kLightAppThemeData.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
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
