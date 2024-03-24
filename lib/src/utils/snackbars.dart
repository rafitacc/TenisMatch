// ignore_for_file: public_member_api_docs, prefer_const_constructors, always_specify_types, lines_longer_than_80_chars, unnecessary_string_interpolations, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBars {
  static void snackbar(
      {required String title,
      required String message,
      required int duration,
      Color color = Colors.black87}) {
    final _style = TextStyle(color: Colors.white);
    Get.snackbar(
      '',
      '',
      titleText: Text(
        '$title',
        style: _style,
      ),
      messageText: Text(
        '$message',
        style: _style,
      ),
      duration: Duration(seconds: duration),
      margin: EdgeInsets.zero,
      backgroundColor: color,
      borderRadius: 0,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void snackbarlikes(
      {required String title,
      required String message,
      required int duration,
      Color color = Colors.black87}) {
    final _style = TextStyle(color: Colors.white);
    Get.snackbar(
      onTap: (snack) {
        Get.back();
      },
      '',
      '',
      titleText: Text(
        '$title',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      messageText: Text(
        '$message',
        style: _style,
      ),
      duration: Duration(seconds: duration),
      margin: EdgeInsets.zero,
      backgroundColor: color,
      borderRadius: 0,
      snackPosition: SnackPosition.TOP,
    );
  }
}
