import 'package:beere_mobile/modules/vendor/vendor_dashboard_module/controller/vendor_dashboard_controller.dart';
import 'package:beere_mobile/routes/routes.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class VendorDashboardView extends StatelessWidget {
  static const String route = '/vendor_dashboard_view';
  const VendorDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<VendorDashboardController>(
      init: VendorDashboardController(),
      builder: (controller) => PersistentTabView(
        context,
        controller: controller.tabController,
        screens: controller.buildScreens(),
        items: _navBarsItems(),
        backgroundColor: kWhite,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        onItemSelected: (index) => controller.selectedIndex = index,
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
            adjustScreenBottomPaddingOnCurve: false,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            colorBehindNavBar: Colors.transparent),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final tab = Get.find<VendorDashboardController>();
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
        icon: Icon(
          Icons.add_business,
          // width: 30.r,
          // height: 30.r,
          color: tab.selectedIndex == 2 ? kPrimaryBlue : kInactiveIcon,
        ),
        textStyle: textStyle,
        title: tab.selectedIndex == 2 ? 'Business' : null,
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

