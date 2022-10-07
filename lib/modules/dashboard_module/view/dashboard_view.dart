import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/modules/dashboard_module/controller/dashboard_controller.dart';
import 'package:beere_mobile/routes/routes.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class DashboardView extends StatelessWidget {
  static const String route = '/dashboard_view';
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
      init: DashboardController(),
      builder: (tabController) => PersistentTabView(
        context,
        controller: tabController.tabController,
        screens: tabController.buildScreens(),
        items: _navBarsItems(),
        backgroundColor: kWhite,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        onItemSelected: (index) => tabController.selectedIndex = index,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
        padding: NavBarPadding.symmetric(horizontal: 20.0.w, vertical: 8.0.h),
        decoration: NavBarDecoration(
            border: Border.all(color: kBorderColor),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            colorBehindNavBar: Colors.transparent),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final tab = Get.find<DashboardController>();
    final textStyle = kStylePoppins.copyWith(
        fontWeight: FontWeight.w500, fontSize: 11.sp, letterSpacing: -0.24.sp);
    return [
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings:
            const RouteAndNavigatorSettings(onGenerateRoute: onGenerateRoutes),
        icon: SvgPicture.asset(
          Assets.homeIcon,
          width: 30.r,
          height: 30.r,
          color: tab.selectedIndex == 0 ? kPrimaryBlue : kInactiveIcon,
        ),
        textStyle: textStyle,
        title: tab.selectedIndex == 0 ? 'Home' : null,
        activeColorPrimary: kPrimaryBlue,
        // inactiveColorPrimary: CupertinoColors.systemGrey,
        contentPadding: 0,
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings:
            const RouteAndNavigatorSettings(onGenerateRoute: onGenerateRoutes),
        icon: SvgPicture.asset(
          Assets.userIcon,
          width: 30.r,
          height: 30.r,
          color: tab.selectedIndex == 1 ? kPrimaryBlue : kInactiveIcon,
        ),
        textStyle: textStyle,
        title: tab.selectedIndex == 1 ? 'Profile' : null,
        activeColorPrimary: kPrimaryBlue,
        // inactiveColorPrimary: CupertinoColors.systemGrey,
        contentPadding: 0,
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings:
            const RouteAndNavigatorSettings(onGenerateRoute: onGenerateRoutes),
        icon: SvgPicture.asset(
          usertype == UserType.user ? Assets.cartIcon : Assets.businessIcon,
          width: 30.r,
          height: 30.r,
          color: tab.selectedIndex == 2 ? kPrimaryBlue : kInactiveIcon,
        ),
        textStyle: textStyle,
        title: tab.selectedIndex == 2
            ? usertype == UserType.user
                ? 'Cart'
                : 'Business'
            : null,
        activeColorPrimary: kPrimaryBlue,
        // inactiveColorPrimary: CupertinoColors.systemGrey,
        contentPadding: 0,
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings:
            const RouteAndNavigatorSettings(onGenerateRoute: onGenerateRoutes),
        icon: SvgPicture.asset(
          Assets.settingsIcon,
          width: 30.r,
          height: 30.r,
          color: tab.selectedIndex == 3 ? kPrimaryBlue : kInactiveIcon,
        ),
        textStyle: textStyle,
        title: tab.selectedIndex == 3 ? 'Settings' : null,
        activeColorPrimary: kPrimaryBlue,
        // inactiveColorPrimary: CupertinoColors.systemGrey,
        contentPadding: 0,
      ),
    ];
  }
}
