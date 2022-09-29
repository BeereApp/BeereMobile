import 'package:beere_mobile/modules/vendor/onboarding_module/view/vendor_home_page.dart';
import 'package:beere_mobile/modules/vendor/tabs_screen_module/view/tabs_view.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class VendorDashboardController extends GetxController {
  final RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  set selectedIndex(int value) => _selectedIndex.value = value;

  final tabController = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      VendorHomePage(),
      TabsScreen(),
      // const Center(
      //   child: MyText('Profile'),
      // ),
      const Center(
        child: MyText("Business"),
      ),
      const Center(
        child: MyText('Settings'),
      ),
    ];
  }

}
