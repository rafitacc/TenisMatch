import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeLight(context) {
  var baseTheme = ThemeData(brightness: Brightness.light);

  return ThemeData(
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme).copyWith(
      titleLarge: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      titleMedium: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      titleSmall: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      bodyLarge: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      bodyMedium: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      bodySmall: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      elevation: 0,
    ),
    hoverColor: const Color.fromRGBO(255, 168, 170, 0.3),
    colorScheme: const ColorScheme(
      primary: Color.fromRGBO(12, 166, 242, 1),
      onPrimary: Color.fromRGBO(119, 205, 248, 1),
      onPrimaryContainer: Color.fromRGBO(226, 244, 253, 1),
      secondary: Color.fromRGBO(34, 40, 42, 1),
      onSecondary: Color.fromRGBO(34, 40, 42, 1),
      primaryContainer: Color.fromRGBO(34, 40, 42, 1),
      background: Color.fromRGBO(255, 255, 255, 1),
      onBackground: Color.fromRGBO(240, 243, 245, 1),
      surface: Color.fromRGBO(34, 40, 42, 1),
      onSurface: Color.fromRGBO(34, 40, 42, 1),
      surfaceVariant: Color.fromRGBO(240, 243, 245, 1), //background
      surfaceTint: Color.fromRGBO(34, 40, 42, 1),

      shadow: Color.fromRGBO(218, 215, 215, 1),

      error: Color.fromRGBO(212, 12, 12, 1),

      onError: Colors.white,
      brightness: Brightness.light,
      inversePrimary: Colors.white,
    ),
    dividerColor: const Color.fromRGBO(220, 223, 225, 1),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        gapPadding: 16,
        borderSide:
            BorderSide(color: Color.fromRGBO(153, 153, 153, 1), width: 2.0),
      ),
      contentPadding: EdgeInsets.all(16),
      labelStyle: TextStyle(fontSize: 14),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(34, 40, 42, 0.9),
      foregroundColor: Colors.white,
    ),
  );
}
