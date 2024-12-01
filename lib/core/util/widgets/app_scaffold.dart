
import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/language_manager.dart';

class AppScaffold extends StatelessWidget {
  final Widget? webScaffold;
  final Widget mobileScaffold;

  const AppScaffold({
    super.key,
    this.webScaffold,
    required this.mobileScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          LanguageManager.isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1270) {
            return webScaffold ?? mobileScaffold;
          }

          return mobileScaffold;
        },
      ),
    );
  }
}
