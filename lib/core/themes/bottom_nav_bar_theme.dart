import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';


abstract class ButtonNavBarThemeManager {
  static  BottomNavigationBarThemeData light = BottomNavigationBarThemeData(
    backgroundColor: const Color(HxaColorsLight.heading),
    elevation: 0.0,
    selectedItemColor: const Color(HxaColorsLight.primary),
    unselectedItemColor: Colors.grey[400],
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle:  const TextStyle(
      height: 1.5,
      fontFamily: FontFamily.plusJakartaSans,
    ),
  );

}