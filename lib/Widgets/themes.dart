import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData get lighttheme => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      canvasColor: creamColor,
      cardColor: Colors.white,
      buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: darkBluishColor,
        brightness: Brightness.light,
        // Your accent color
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: darkBluishColor),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ));

  static ThemeData get darktheme => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      canvasColor: darkCreamColor,
      cardColor: Colors.black,
      buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.white,
          brightness: Brightness.dark // Your accent color
          ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: lightBluishColor),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ));

  //colors
  static const Color creamColor = Color(0xfff5f5f5);
  static const Color darkCreamColor = Vx.gray900;
  static const Color darkBluishColor = Color(0xff403b58);
  static const Color lightBluishColor = Vx.indigo500;
}
