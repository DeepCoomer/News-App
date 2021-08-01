import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme with ChangeNotifier {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      accentColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme:
          TextTheme(caption: TextStyle(color: Colors.black, fontSize: 20)),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme:
          TextTheme(caption: TextStyle(color: Colors.white, fontSize: 20)),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ));

      static bool isDark = false;

      ThemeMode currentTheme() {
        return isDark ? ThemeMode.dark : ThemeMode.light;
      }

      void switchTheme() {
        isDark = !isDark;
        notifyListeners();
      }
}
