import 'package:nana/core/di/app_injection_component.dart';
import 'package:nana/core/di/injection_module.dart';
import 'package:nana/core/themes/theme.dart';
import 'package:nana/core/util/cubit/app_cubit.dart';
import 'package:nana/core/util/cubit/app_state.dart';
import 'package:nana/core/util/resources/bloc_observer_manager.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/di/inject_cache.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInjectionComponent.instance
      .registerModules(module: InjectionModule());

  await di.initCache();

  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await LanguageManager.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    EasyLocalization(
      saveLocale: true,
      fallbackLocale: const Locale.fromSubtags(languageCode: 'en'),
      startLocale: LanguageManager.currentLanguageCode,
      useOnlyLangCode: true,
      supportedLocales: LanguageManager.supportedLocales,
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => inject<AppCubit>(),
          ),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: 'Nana',
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: ThemeManager.light,
              routeInformationParser: AppRouter.router.routeInformationParser,
              routeInformationProvider:
                  AppRouter.router.routeInformationProvider,
              routerDelegate: AppRouter.router.routerDelegate,
              localizationsDelegates: [
                ...context.localizationDelegates,
              ],
              supportedLocales: context.supportedLocales,
              locale: context.locale,
            );
          },
        ),
      ),
    );
  }
}
