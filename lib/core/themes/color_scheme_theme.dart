import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';

abstract class ColorSchemeThemeManager {
  static const ColorScheme light = ColorScheme.light(
    primary: Color(HxaColorsLight.primary),
    secondary: Color(HxaColorsLight.heading),
    onSecondary: Color(HxaColorsLight.grey2),
    secondaryContainer: Color(HxaColorsLight.heading),
    onSecondaryContainer: Color(HxaColorsLight.heading),
    tertiary: Color(HxaColorsLight.grey1),
    onTertiary: Color(HxaColorsLight.grey1),
    surface: Color(HxaColorsLight.grey1),
    onSurface: Color(HxaColorsLight.grey1),
    error: Color(HxaColorsLight.errorColor),
    onError: Color(HxaColorsLight.grey1),
    brightness: Brightness.light,
  );
}