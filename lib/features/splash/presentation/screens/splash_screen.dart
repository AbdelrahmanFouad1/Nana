import 'dart:async';

import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/splash/presentation/widgets/splash_logo_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isFirstTime;
  late bool isAlreadyLogin;

  _startDelay() async {
    await _validateIsAlreadyLogin().then(
          (value) => Timer(ConstantsManger.splashDelay, _goNext),
    );
  }


  Future<void> _validateIsAlreadyLogin() async {
    await inject<CacheHelper>()
        .get(ConstantsManger.isAlreadyLogin)
        .then((value) {
      if (value != null) {
        isAlreadyLogin = value as bool;
      } else {
        isAlreadyLogin = false;
      }
    });
  }

  Future<void> _goNext() async {
    if (mounted) {
       if (isAlreadyLogin) {
        context.go(Routes.homeScreen);
      } else {
        context.go(Routes.homeScreen);
      }
    }
  }

  @override
  initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: context.appColor.white,
      ),
      child: const Center(
        child: SplashLogoWidget(),
      ),
    );
  }
}
