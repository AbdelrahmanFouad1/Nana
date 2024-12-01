import 'package:nana/core/themes/app_bar_theme.dart';
import 'package:nana/core/themes/bottom_nav_bar_theme.dart';
import 'package:nana/core/themes/button_theme.dart';
import 'package:nana/core/themes/color_scheme_theme.dart';
import 'package:nana/core/themes/text_theme.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';

abstract class ThemeManager {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    extensions: <ThemeExtension<dynamic>>[
      AppColor(
        primary: const Color(HxaColorsLight.primary),
        heading: const Color(HxaColorsLight.heading),
        subHeading: const Color(HxaColorsLight.subHeading),
        greenDark: const Color(HxaColorsLight.greenDark),
        green: const Color(HxaColorsLight.green),
        greenLight: const Color(HxaColorsLight.greenLight),
        greenMint: const Color(HxaColorsLight.greenMint),
        silver: const Color(HxaColorsLight.silver),
        blue1: const Color(HxaColorsLight.blue1),
        blue2: const Color(HxaColorsLight.blue2),
        blue3: const Color(HxaColorsLight.blue3),
        blueDark: const Color(HxaColorsLight.blueDark),
        white: const Color(HxaColorsLight.white),
        black: const Color(HxaColorsLight.black),
        grey100: const Color(HxaColorsLight.grey100),
        grey200: const Color(HxaColorsLight.grey200),
        grey300: const Color(HxaColorsLight.grey300),
        grey400: const Color(HxaColorsLight.grey400),
        grey500: const Color(HxaColorsLight.grey500),
        grey600: const Color(HxaColorsLight.grey600),
        grey700: const Color(HxaColorsLight.grey700),
        grey1: const Color(HxaColorsLight.grey1),
        grey2: const Color(HxaColorsLight.grey2),
        grey3: const Color(HxaColorsLight.grey3),
        infoColor: const Color(HxaColorsLight.infoColor),
        infoBGColor: const Color(HxaColorsLight.infoBGColor),
        warningColor: const Color(HxaColorsLight.warningColor),
        warningBGColor: const Color(HxaColorsLight.warningBGColor),
        successColor: const Color(HxaColorsLight.successColor),
        successBGColor: const Color(HxaColorsLight.successBGColor),
        errorColor: const Color(HxaColorsLight.errorColor),
        errorBGColor: const Color(HxaColorsLight.errorBGColor),
      ),
    ],
    scaffoldBackgroundColor: const Color(HxaColorsLight.grey300),
    primaryColor: const Color(HxaColorsLight.primary),
    colorScheme: ColorSchemeThemeManager.light,
    appBarTheme: AppBarThemeManager.light,
    textTheme: AppTextThemeManager.light,
    buttonTheme: ButtonThemeManager.light,
    bottomNavigationBarTheme: ButtonNavBarThemeManager.light,
  );
}
