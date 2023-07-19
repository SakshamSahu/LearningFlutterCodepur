import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get lighttheme => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
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
        brightness: Brightness.dark,
      );

  //colors
  static const Color creamColor = Color(0xfff5f5f5);
  static const Color darkBluishColor = Color(0xff403b58);
}
