import 'dart:async';

import 'package:nana/core/di/injection_container.dart';
import 'package:nana/core/di/injection_module.dart';


/// This is just a wrapper class that iterate throught the injection modules
/// and add each dependency into the injection container.
class AppInjectionComponent {
  AppInjectionComponent._();

  static AppInjectionComponent instance = AppInjectionComponent._();

  Future<void> registerModules({
    required InjectionModule module,
  }) async {

      await module.registerDependencies(
        injector: inject,
      );

  }
}
