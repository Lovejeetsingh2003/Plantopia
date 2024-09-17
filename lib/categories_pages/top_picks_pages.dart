import 'package:flutter/material.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/main.dart';

class TopPicksPages extends StatefulWidget {
  const TopPicksPages({super.key});

  @override
  State<TopPicksPages> createState() => _TopPicksPagesState();
}

class _TopPicksPagesState extends State<TopPicksPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (BuildContext context, int index) {
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
        ],
      ),
    );
  }
}
