import 'package:flutter/material.dart';

abstract class HxaColorsLight {
  /// Scheme Colors

  static const primary = 0XFF548404;
  static const subHeading = 0xff3A3A3C;
  static const heading = 0xff202020;
  static const silver = 0xFFE9ECF2;

  /// Customer color palette
  static const blue1 = 0xFF1367D8;
  static const blue2 = 0xFF036CF2;
  static const blue3 = 0xFF0A69B1;
  static const blueDark = 0xFF001833;
  static const greenDark = 0xff96C828;
  static const green = 0xFF48BD69;
  static const greenLight = 0xFFE8F7ED;
  static const greenMint = 0xFF14B8A6;

  /// Black and white
  static const white = 0xFFFFFFFF;
  static const black = 0xFF000000;

  /// Gray colors
  static const grey100 = 0xFFEEEEEE;
  static const grey200 = 0xFFF2F2F2;
  static const grey300 = 0xFFF1F5F9;
  static const grey400 = 0xFFD1D7E0;
  static const grey500 = 0xFFA2A2A2;
  static const grey600 = 0xFF797979;
  static const grey700 = 0xFFC4C4C4;
  static const grey1 = 0xFFE4E4E4;
  static const grey2 = 0xFF999999;
  static const grey3 = 0xFF8C8C8C;

  /// Success (green), error (red) and alert (yellow) colors
  static const infoColor = 0xFF2F80ED;
  static const infoBGColor = 0xFFF1F6FE;
  static const warningColor = 0xFFFFCC00;
  static const warningBGColor = 0xFFFFF5CC;
  static const successColor = 0xFF8CC63E;
  static const successBGColor = 0xFFD0E8B0;
  static const errorColor = 0xFFF3405D;
  static const errorBGColor = 0xFFFDE2E6;
}

abstract class _ColorManager {
  /// Scheme Colors
  static const primary = Color(HxaColorsLight.primary);

  static const heading = Color(HxaColorsLight.heading);
  static const subHeading = Color(HxaColorsLight.subHeading);
  static const greenDark = Color(HxaColorsLight.greenDark);
  static const silver = Color(HxaColorsLight.silver);

  /// Customer color palette
  static const blue1 = Color(HxaColorsLight.blue1);
  static const blue2 = Color(HxaColorsLight.blue2);
  static const blue3 = Color(HxaColorsLight.blue3);
  static const blueDark = Color(HxaColorsLight.blueDark);
  static const green = Color(HxaColorsLight.green);
  static const greenLight = Color(HxaColorsLight.greenLight);
  static const greenMint = Color(HxaColorsLight.greenMint);

  /// Black and white
  static const white = Color(HxaColorsLight.white);
  static const black = Color(HxaColorsLight.black);

  /// Gray colors
  static const grey100 = Color(HxaColorsLight.grey100);
  static const grey200 = Color(HxaColorsLight.grey200);
  static const grey300 = Color(HxaColorsLight.grey300);
  static const grey400 = Color(HxaColorsLight.grey400);
  static const grey500 = Color(HxaColorsLight.grey500);
  static const grey600 = Color(HxaColorsLight.grey600);
  static const grey700 = Color(HxaColorsLight.grey700);
  static const grey1 = Color(HxaColorsLight.grey1);
  static const grey2 = Color(HxaColorsLight.grey2);
  static const grey3 = Color(HxaColorsLight.grey3);

  /// Success (green), error (red) and alert (yellow) colors
  static const infoColor = Color(HxaColorsLight.infoColor);
  static const infoBGColor = Color(HxaColorsLight.infoBGColor);
  static const warningColor = Color(HxaColorsLight.warningColor);
  static const warningBGColor = Color(HxaColorsLight.warningBGColor);
  static const successColor = Color(HxaColorsLight.successColor);
  static const successBGColor = Color(HxaColorsLight.successBGColor);
  static const errorColor = Color(HxaColorsLight.errorColor);
  static const errorBGColor = Color(HxaColorsLight.errorBGColor);
}

class AppColor extends ThemeExtension<AppColor> {
  /// Scheme Colors
  final Color primary;
  final Color heading;
  final Color subHeading;
  final Color greenDark;
  final Color silver;

  /// Customer color palette
  final Color blue1;
  final Color blue2;
  final Color blue3;
  final Color blueDark;
  final Color green;
  final Color greenLight;
  final Color greenMint;

  /// Black and white
  final Color white;
  final Color black;

  /// Gray colors
  final Color grey100;
  final Color grey200;
  final Color grey300;
  final Color grey400;
  final Color grey500;
  final Color grey600;
  final Color grey700;
  final Color grey1;
  final Color grey2;
  final Color grey3;

  /// Success (green), error (red) and alert (yellow) colors
  final Color infoColor;
  final Color infoBGColor;
  final Color warningColor;
  final Color warningBGColor;
  final Color successColor;
  final Color successBGColor;
  final Color errorColor;
  final Color errorBGColor;

  AppColor({
    required this.primary,
    required this.heading,
    required this.subHeading,
    required this.greenDark,
    required this.silver,
    required this.blue1,
    required this.blue2,
    required this.blue3,
    required this.blueDark,
    required this.green,
    required this.greenLight,
    required this.greenMint,
    required this.white,
    required this.black,
    required this.grey100,
    required this.grey200,
    required this.grey300,
    required this.grey400,
    required this.grey500,
    required this.grey600,
    required this.grey700,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.infoColor,
    required this.infoBGColor,
    required this.warningColor,
    required this.warningBGColor,
    required this.successColor,
    required this.successBGColor,
    required this.errorColor,
    required this.errorBGColor,
  });

  @override
  ThemeExtension<AppColor> copyWith({
    Color? primary,
    Color? heading,
    Color? subHeading,
    Color? greenDark,
    Color? silver,
    Color? blue1,
    Color? blue2,
    Color? blue3,
    Color? blueDark,
    Color? green,
    Color? greenLight,
    Color? greenMint,
    Color? white,
    Color? black,
    Color? grey100,
    Color? grey200,
    Color? grey300,
    Color? grey400,
    Color? grey500,
    Color? grey600,
    Color? grey700,
    Color? grey1,
    Color? grey2,
    Color? grey3,
    Color? infoColor,
    Color? infoBGColor,
    Color? warningColor,
    Color? warningBGColor,
    Color? successColor,
    Color? successBGColor,
    Color? errorColor,
    Color? errorBGColor,
  }) {
    return AppColor(
      primary: primary ?? this.primary,
      heading: heading ?? this.heading,
      subHeading: subHeading ?? this.subHeading,
      greenDark: greenDark ?? this.greenDark,
      silver: silver ?? this.silver,
      blue1: blue1 ?? this.blue1,
      blue2: blue2 ?? this.blue2,
      blue3: blue3 ?? this.blue3,
      blueDark: blueDark ?? this.blueDark,
      green: green ?? this.green,
      greenLight: greenLight ?? this.greenLight,
      greenMint: greenMint ?? this.greenMint,
      white: white ?? this.white,
      black: black ?? this.black,
      grey100: grey100 ?? this.grey100,
      grey200: grey200 ?? this.grey200,
      grey300: grey300 ?? this.grey300,
      grey400: grey400 ?? this.grey400,
      grey500: grey500 ?? this.grey500,
      grey600: grey600 ?? this.grey600,
      grey700: grey700 ?? this.grey700,
      grey1: grey1 ?? this.grey1,
      grey2: grey2 ?? this.grey2,
      grey3: grey3 ?? this.grey3,
      infoColor: infoColor ?? this.infoColor,
      infoBGColor: infoBGColor ?? this.infoBGColor,
      warningColor: warningColor ?? this.warningColor,
      warningBGColor: warningBGColor ?? this.warningBGColor,
      successColor: successColor ?? this.successColor,
      successBGColor: successBGColor ?? this.successBGColor,
      errorColor: errorColor ?? this.errorColor,
      errorBGColor: errorBGColor ?? this.errorBGColor,
    );
  }

  @override
  ThemeExtension<AppColor> lerp(
      covariant ThemeExtension<AppColor>? other, double t) {
    if (other == null) return copyWith();
    return copyWith(
      primary: Color.lerp(primary, _ColorManager.primary, t),
      heading: Color.lerp(heading, _ColorManager.heading, t),
      subHeading: Color.lerp(subHeading, _ColorManager.subHeading, t),
      greenDark: Color.lerp(greenDark, _ColorManager.greenDark, t),
      silver: Color.lerp(silver, _ColorManager.silver, t),
      blue1: Color.lerp(blue1, _ColorManager.blue1, t),
      blue2: Color.lerp(blue2, _ColorManager.blue2, t),
      blue3: Color.lerp(blue3, _ColorManager.blue3, t),
      blueDark: Color.lerp(blueDark, _ColorManager.blueDark, t),
      green: Color.lerp(green, _ColorManager.green, t),
      greenLight: Color.lerp(greenLight, _ColorManager.greenLight, t),
      greenMint: Color.lerp(greenMint, _ColorManager.greenMint, t),
      white: Color.lerp(white, _ColorManager.white, t),
      black: Color.lerp(black, _ColorManager.black, t),
      grey100: Color.lerp(grey100, _ColorManager.grey100, t),
      grey200: Color.lerp(grey200, _ColorManager.grey200, t),
      grey300: Color.lerp(grey300, _ColorManager.grey300, t),
      grey400: Color.lerp(grey400, _ColorManager.grey400, t),
      grey500: Color.lerp(grey500, _ColorManager.grey500, t),
      grey600: Color.lerp(grey600, _ColorManager.grey600, t),
      grey700: Color.lerp(grey700, _ColorManager.grey700, t),
      grey1: Color.lerp(grey1, _ColorManager.grey1, t),
      grey2: Color.lerp(grey2, _ColorManager.grey2, t),
      grey3: Color.lerp(grey3, _ColorManager.grey3, t),
      infoColor: Color.lerp(infoColor, _ColorManager.infoColor, t),
      infoBGColor: Color.lerp(infoBGColor, _ColorManager.infoBGColor, t),
      warningColor: Color.lerp(warningColor, _ColorManager.warningColor, t),
      warningBGColor:
          Color.lerp(warningBGColor, _ColorManager.warningBGColor, t),
      successColor: Color.lerp(successColor, _ColorManager.successColor, t),
      successBGColor:
          Color.lerp(successBGColor, _ColorManager.successBGColor, t),
      errorColor: Color.lerp(errorColor, _ColorManager.errorColor, t),
      errorBGColor: Color.lerp(errorBGColor, _ColorManager.errorBGColor, t),
    );
  }
}
