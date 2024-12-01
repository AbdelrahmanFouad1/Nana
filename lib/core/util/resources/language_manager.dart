import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nana/core/di/injection_container.dart';
import 'package:nana/core/network/local/cache_helper.dart';
import 'package:nana/core/util/resources/constants_manager.dart';

class LanguageManager {
  static Locale? currentLanguageCode;

  static Future<void> init() async {
    inject<CacheHelper>().get(ConstantsManger.languageCode).then(
      (value) {
        if (value != null) {
          currentLanguageCode = Locale(value);
        } else {
          supportedLocales
                  .contains(Locale(Platform.localeName.split('_').first))
              ? currentLanguageCode =
                  Locale(Platform.localeName.split('_').first)
              : currentLanguageCode = const Locale(ConstantsManger.englishCode);
        }
      },
    ); //
  } // Default language code

  static void updateLanguage(String newLanguageCode) {
    inject<CacheHelper>().put(ConstantsManger.languageCode, newLanguageCode);
    currentLanguageCode = Locale(newLanguageCode);
  }

  static bool get isArabic =>
      currentLanguageCode?.languageCode == ConstantsManger.arabicCode;

  static List<Locale> supportedLocales = [
    const Locale(ConstantsManger.englishCode),
    const Locale(ConstantsManger.arabicCode),
  ];
}
