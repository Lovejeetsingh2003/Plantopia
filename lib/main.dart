import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantopia/colors.dart';
import 'package:plantopia/login_pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: kLightAppThemeData,
      darkTheme: kDarkAppThemeData,
      home: const WelcomePage(),
    );
  }
}

final ThemeData kLightAppThemeData = _buildLightThemeData();

ThemeData _buildLightThemeData() {
  final base = ThemeData.light();
  final baseTextTheme = GoogleFonts.interTextTheme(base.textTheme);
  return base.copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: baseTextTheme.copyWith(
      titleLarge: baseTextTheme.titleLarge!.copyWith(
        height: 32.0 / 22.0,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: kMainTextColor,
        letterSpacing: 0.5,
      ),
      titleMedium: baseTextTheme.titleMedium!.copyWith(
        height: 27.0 / 17.0,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: kMainTextColor,
        letterSpacing: 0.5,
      ),
      titleSmall: baseTextTheme.titleSmall!.copyWith(
        height: 25.0 / 15.0,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: kMainTextColor,
        letterSpacing: 0.5,
      ),
      bodyLarge: baseTextTheme.bodyLarge!.copyWith(
        fontSize: 32.0,
        height: 27.0 / 17.0,
        color: kMainTextColor,
        letterSpacing: 0.5,
      ),
      bodyMedium: baseTextTheme.bodyMedium!.copyWith(
        fontSize: 20.0,
        height: 25.0 / 15.0,
        color: kMainTextColor,
        letterSpacing: 0.5,
      ),
      bodySmall: baseTextTheme.bodySmall!.copyWith(
        height: 15.0 / 12.0,
        fontSize: 18,
        color: kMainTextColor,
        letterSpacing: 0.5,
      ),
    ),
  );
}

final ThemeData kDarkAppThemeData = _buildDarkThemeData();

ThemeData _buildDarkThemeData() {
  final base = ThemeData.dark();
  final baseTextTheme = GoogleFonts.interTextTheme(base.textTheme);
  return base.copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: baseTextTheme.copyWith(
      titleLarge: baseTextTheme.titleLarge!.copyWith(
        height: 32.0 / 22.0,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: kSecondaryTextColor,
        letterSpacing: 0.5,
      ),
      titleMedium: baseTextTheme.titleMedium!.copyWith(
        height: 27.0 / 17.0,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: kSecondaryTextColor,
        letterSpacing: 0.5,
      ),
      titleSmall: baseTextTheme.titleSmall!.copyWith(
        height: 25.0 / 15.0,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: kSecondaryTextColor,
        letterSpacing: 0.5,
      ),
      bodyLarge: baseTextTheme.bodyLarge!.copyWith(
        fontSize: 32.0,
        height: 27.0 / 17.0,
        color: kSecondaryTextColor,
        letterSpacing: 0.5,
      ),
      bodyMedium: baseTextTheme.bodyMedium!.copyWith(
        fontSize: 20.0,
        height: 25.0 / 15.0,
        color: kSecondaryTextColor,
        letterSpacing: 0.5,
      ),
      bodySmall: baseTextTheme.bodySmall!.copyWith(
        height: 15.0 / 12.0,
        fontSize: 18,
        color: kSecondaryTextColor,
        letterSpacing: 0.5,
      ),
    ),
  );
}
