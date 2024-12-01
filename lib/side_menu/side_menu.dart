import 'package:flutter/material.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/main.dart';
import 'package:plantopia/side_menu/about_page.dart';
import 'package:plantopia/side_menu/acc_details_page.dart';
import 'package:plantopia/side_menu/feedback_page.dart';
import 'package:plantopia/side_menu/order_history_page.dart';
import '../main_pages/info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.3,
              height: double.infinity,
              child: Column(
                children: [
                  const InfoCard(name: "Test", email: "test1@gmai.com"),
                  ListTile(
                    minTileHeight: 80,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const AccDetailsPage(),
                          transitionDuration: const Duration(seconds: 2),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person,
                      color: kMainTextColor,
                      size: 30,
                    ),
                    title: Text(
                      "Account Details",
                      style: kLightAppThemeData.textTheme.bodyMedium,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                    color: kMainTextColor,
                  ),
                  ListTile(
                    minTileHeight: 80,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const OrderHistoryPage(),
                          transitionDuration: const Duration(seconds: 2),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.history,
                      color: kMainTextColor,
                      size: 30,
                    ),
                    title: Text(
                      "Order History",
                      style: kLightAppThemeData.textTheme.bodyMedium,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                    color: kMainTextColor,
                  ),
                  ListTile(
                    minTileHeight: 80,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const AboutPage(),
                          transitionDuration: const Duration(seconds: 2),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.info,
                      color: kMainTextColor,
                      size: 30,
                    ),
                    title: Text(
                      "About",
                      style: kLightAppThemeData.textTheme.bodyMedium,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                    color: kMainTextColor,
                  ),
                  ListTile(
                    minTileHeight: 80,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const FeedbackPage(),
                          transitionDuration: const Duration(seconds: 2),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.feedback,
                      color: kMainTextColor,
                      size: 30,
                    ),
                    title: Text(
                      "Feedback",
                      style: kLightAppThemeData.textTheme.bodyMedium,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                    color: kMainTextColor,
                  ),
                  ListTile(
                    minTileHeight: 80,
                    onTap: () {},
                    leading: const Icon(
                      Icons.logout,
                      color: kMainTextColor,
                      size: 30,
                    ),
                    title: Text(
                      "Logout",
                      style: kLightAppThemeData.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
