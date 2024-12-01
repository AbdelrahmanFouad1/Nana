import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';

abstract class AppTextThemeManager {
  static String get languageFontFamily {
    switch (LanguageManager.currentLanguageCode?.languageCode) {
      case ConstantsManger.englishCode:
        return FontFamily.plusJakartaSans;
      case ConstantsManger.arabicCode:
        return FontFamily.plusJakartaSans;
      default:
        return FontFamily.plusJakartaSans;
    }
  }

  /// Font Size with Screen Util
  static TextTheme get light => TextTheme(
        titleLarge: TextStyle(
          fontSize: ScreenUtil().setSp(34.0),
          fontWeight: FontWeight.w700,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        titleMedium: TextStyle(
          fontSize: ScreenUtil().setSp(32.0),
          fontWeight: FontWeight.w500,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        titleSmall: TextStyle(
          fontSize: ScreenUtil().setSp(31.0),
          fontWeight: FontWeight.w300,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w700,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        labelMedium: TextStyle(
          fontSize: ScreenUtil().setSp(26.0),
          fontWeight: FontWeight.w500,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        labelSmall: TextStyle(
          fontSize: ScreenUtil().setSp(24.0),
          fontWeight: FontWeight.w300,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        displayLarge: TextStyle(
          fontSize: ScreenUtil().setSp(22.0),
          fontWeight: FontWeight.w700,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        displayMedium: TextStyle(
          fontSize: ScreenUtil().setSp(20.0),
          fontWeight: FontWeight.w500,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        displaySmall: TextStyle(
          fontSize: ScreenUtil().setSp(18.0),
          fontWeight: FontWeight.w300,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        bodyLarge: TextStyle(
          fontSize: ScreenUtil().setSp(16.0),
          fontWeight: FontWeight.w700,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        bodyMedium: TextStyle(
          fontSize: ScreenUtil().setSp(14.0),
          fontWeight: FontWeight.w500,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
        bodySmall: TextStyle(
          fontSize: ScreenUtil().setSp(12.0),
          fontWeight: FontWeight.w300,
          color: const Color(HxaColorsLight.heading),
          fontFamily: languageFontFamily,
          height: 1.3,
        ),
      );
}
