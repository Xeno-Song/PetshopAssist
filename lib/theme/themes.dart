import 'package:flutter/material.dart';

// https://annhee.tistory.com/119
// https://medium.com/flutterworld/flutter-material-color-conversion-ad1574f25828

class Themes {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: ll,
    // primarySwatch: const Color.fromARGB(0xFF, 0xAC, 0x70, 0x88),
    brightness: Brightness.light,
    primaryColorLight: Colors.red,
    // primaryColorLight: const Color.fromARGB(0xFF, 0xAC, 0x70, 0x88),
    // primaryColor: const Color.fromARGB(0xFF, 0xFF, 0x00, 0x00),
    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color.fromARGB(0xFF, 0xF5, 0xE8, 0xC7)),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(0xFF, 0xAC, 0x70, 0x88),
      onPrimary: Color.fromARGB(0xFF, 0xAC, 0x70, 0x88),
      secondary: Color.fromARGB(0xFF, 0xDE, 0xB6, 0xAB),
      onSecondary: Color.fromARGB(0xFF, 0xDE, 0xB6, 0xAB),
      error: Colors.red,
      onError: Colors.red,
      background: Colors.white,
      onBackground: Colors.white,
      surface: Colors.grey,
      onSurface: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(0xFF, 0xAC, 0x70, 0x88),
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(0xFF, 0xF5, 0xE8, 0xC7),
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFF7EDF3),
    ),
  );

  static Map<int, Color> colorCodes = {
    50: const Color.fromRGBO(0xAC, 0x70, 0x88, .1),
    100: const Color.fromRGBO(0xAC, 0x70, 0x88, .2),
    200: const Color.fromRGBO(0xAC, 0x70, 0x88, .3),
    300: const Color.fromRGBO(0xAC, 0x70, 0x88, .4),
    400: const Color.fromRGBO(0xAC, 0x70, 0x88, .5),
    500: const Color.fromRGBO(0xAC, 0x70, 0x88, .6),
    600: const Color.fromRGBO(0xAC, 0x70, 0x88, .7),
    700: const Color.fromRGBO(0xAC, 0x70, 0x88, .8),
    800: const Color.fromRGBO(0xAC, 0x70, 0x88, .9),
    900: const Color.fromRGBO(0xAC, 0x70, 0x88, 1),
  };
  static MaterialColor ll = MaterialColor(0xFFAC7088, colorCodes);
}
