import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';

abstract class ButtonThemeManager {
  static const ButtonThemeData  light = ButtonThemeData(
    minWidth: 5,
    focusColor:  Color(HxaColorsLight.primary),
  );
}