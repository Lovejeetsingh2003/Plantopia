import 'package:flutter/material.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/main.dart';
import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      // floatingActionButton: FloatingActionButton(
      //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //     backgroundColor: kMainTextColor,
      //     shape: ShapeBorder.lerp(
      //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      //       const CircleBorder(),
      //       0.5,
      //     ),
      //     child: const Icon(
      //       Icons.close,
      //       size: 35,
      //       color: kPrimaryColor,
      //     ),
      //     onPressed: () {}),
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
                  topRight: Radius.circular(40),
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
                    onTap: () {},
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
                    onTap: () {},
                    leading: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                    title: Text(
                      "Favourites",
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
                    onTap: () {},
                    leading: const Icon(
                      Icons.settings,
                      color: kMainTextColor,
                      size: 30,
                    ),
                    title: Text(
                      "Setting",
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
                    onTap: () {},
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
