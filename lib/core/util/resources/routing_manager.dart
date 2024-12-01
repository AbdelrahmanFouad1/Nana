import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/cart/presentation/screens/cart_screen.dart';
import 'package:nana/features/home/presentation/screens/home_screen.dart';
import 'package:nana/features/main/presentation/screens/main_screen.dart';
import 'package:nana/features/menu/presentation/screens/setting_screen.dart';
import 'package:nana/features/rewards/presentation/screens/rewards_screen.dart';
import 'package:nana/features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String mainScreen = '/main';
  static const String homeScreen = '/home';
  static const String cartScreen = '/cart';
  static const String rewardsScreen = '/rewards';
  static const String menuScreen = '/menu';
}

class AppRouter {
  static final GoRouter router = _returnRouter();

  static GoRouter _returnRouter() {
    GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: Routes.splashScreen,
      routes: [
        GoRoute(
          name: Routes.splashScreen,
          path: Routes.splashScreen,
          pageBuilder: (_, state) => _CustomSlideTransition(
            child: SplashScreen(),
          ),
        ),
        ShellRoute(
          builder: (context, state, child) => MainScreen(child: child),
          routes: [
            GoRoute(
              name: Routes.homeScreen,
              path: Routes.homeScreen,
              pageBuilder: (_, state) => _CustomSlideTransition(
                child: HomeScreen(),
              ),
            ),
            GoRoute(
              name: Routes.cartScreen,
              path: Routes.cartScreen,
              pageBuilder: (_, state) => _CustomSlideTransition(
                child: CartScreen(),
              ),
            ),
            GoRoute(
              name: Routes.rewardsScreen,
              path: Routes.rewardsScreen,
              pageBuilder: (_, state) => _CustomSlideTransition(
                child: RewardsScreen(),
              ),
            ),
            GoRoute(
              name: Routes.menuScreen,
              path: Routes.menuScreen,
              pageBuilder: (_, state) => _CustomSlideTransition(
                child: MenuScreen(),
              ),
            ),
          ],
        ),
      ],
    );
    return router;
  }
}


class _CustomSlideTransition extends CustomTransitionPage {
  _CustomSlideTransition({required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, animation, __, child) {
            // Change the opacity of the screen using a Curve based on the the animation's
            // value
            return FadeTransition(
              opacity:
              CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
}
