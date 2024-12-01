import 'dart:async';

import 'package:nana/core/util/resources/common_dependencies.dart';



class InjectionModule  {
  FutureOr<void> registerDependencies(
      {required GetIt injector})  async {
    configureDependencies(injector);

  }

}



