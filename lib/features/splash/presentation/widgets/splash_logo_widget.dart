import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Assets.logo.logo.image(),
    );
  }
}
