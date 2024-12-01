import 'package:nana/core/di/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/core/network/local/cache_helper.dart';


Future<void> initCache() async {

  inject.registerLazySingleton<CacheHelper>(
    () => CacheImpl(inject()),
  );



  final sharedPreferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => sharedPreferences);
}
