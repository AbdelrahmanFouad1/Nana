import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/home/presentation/cubit/home_cubit.dart';

class MenuItems {
  final String title;
  final Widget iconPath;
  final Widget activeIconPath;

  const MenuItems({
    required this.title,
    required this.iconPath,
    required this.activeIconPath,
  });
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child});

  final Widget child;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _bottomNavItem = [
    MenuItems(
      title: 'home',
      iconPath: Assets.icons.home.svg(
        width: 24.w,
        height: 24.h,
      ),
      activeIconPath: Assets.icons.activeHome.svg(
        width: 24.w,
        height: 24.h,
      ),
    ),
    MenuItems(
      title: 'cart',
      iconPath: Assets.icons.cart.svg(
        width: 24.w,
        height: 24.h,
      ),
      activeIconPath: Assets.icons.activeCart.svg(
        width: 24.w,
        height: 24.h,
      ),
    ),
    MenuItems(
      title: 'rewards',
      iconPath: Assets.icons.rewards.svg(
        width: 24.w,
        height: 24.h,
      ),
      activeIconPath: Assets.icons.activeRewards.svg(
        width: 24.w,
        height: 24.h,
      ),
    ),
    MenuItems(
      title: 'menu',
      iconPath: Assets.icons.menu.svg(
        width: 24.w,
        height: 24.h,
      ),
      activeIconPath: Assets.icons.activeMenu.svg(
        width: 24.w,
        height: 24.h,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final buildBottomNav = _bottomNavItem
        .map(
          (e) => BottomNavigationBarItem(
            activeIcon: e.activeIconPath,
            icon: e.iconPath,
            label: e.title.tr(),
          ),
        )
        .toList();

    return BlocProvider(
      create: (context) => inject<HomeCubit>()..products(),
      child: Scaffold(
        body: widget.child,
        appBar: AppbarGeneral(
          leadingPadding: EdgeInsets.symmetric(horizontal: 16.w),
          leading:
              _calculateSelectedIndex(context).$2 ? null : const SizedBox(),
          actions: [
            if (!_calculateSelectedIndex(context).$2) ...[
              Text(
                buildBottomNav
                        .elementAt(_calculateSelectedIndex(context).$1)
                        .label ??
                    '',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
            ],
            IconButton(
              icon: Assets.icons.bell.svg(width: 24.w, height: 24.h),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: buildBottomNav,
          currentIndex: _calculateSelectedIndex(context).$1,
          backgroundColor: context.appColor.grey300,
          selectedItemColor: context.appColor.primary,
          unselectedItemColor: context.appColor.grey700,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: context.appColor.primary,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                height: 1.4,
              ),
          unselectedLabelStyle:
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: context.appColor.grey700,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    height: 1.4,
                  ),
          onTap: _onTap,
        ),
      ),
    );
  }

  (int, bool) _calculateSelectedIndex(BuildContext context) {
    final GoRouterState route = GoRouterState.of(context);
    if (route.fullPath == Routes.homeScreen) {
      return (0, false);
    }
    if (route.fullPath == Routes.cartScreen) {
      return (1, false);
    }
    if (route.fullPath == Routes.rewardsScreen) {
      return (2, false);
    }
    if (route.fullPath == Routes.menuScreen) {
      return (3, false);
    }
    return (0, true);
  }

  _onTap(int value) {
    switch (value) {
      case 0:
        return context.go(Routes.homeScreen);
      case 1:
        return context.go(Routes.cartScreen);
      case 2:
        return context.go(Routes.rewardsScreen);
      case 3:
        return context.go(Routes.menuScreen);
      default:
        return context.go(Routes.homeScreen);
    }
  }
}
