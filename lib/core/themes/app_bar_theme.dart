import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppBarThemeManager {
  static  AppBarTheme light = const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0.0,
    titleSpacing: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 20.0,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamily.plusJakartaSans,
    ),
  );

}