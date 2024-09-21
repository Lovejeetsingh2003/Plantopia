import 'package:flutter/material.dart';
import 'package:plantopia/categories_pages/bottom_sheet_page.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/main.dart';
import 'package:plantopia/main_pages/home_page.dart';

class TopPicksPages extends StatefulWidget {
  const TopPicksPages({super.key});

  @override
  State<TopPicksPages> createState() => _TopPicksPagesState();
}

class _TopPicksPagesState extends State<TopPicksPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
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
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Echeveria\nElegans",
                                  style: kDarkAppThemeData.textTheme.titleSmall,
                                ),
                                Text(
                                  "580 Rs.",
                                  style: kLightAppThemeData.textTheme.bodyLarge,
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                showBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const BottomSheetPage();
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
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 35,
                      child: Image(
                        width: 120,
                        height: 120,
                        image: AssetImage("assets/images/plant2.png"),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
