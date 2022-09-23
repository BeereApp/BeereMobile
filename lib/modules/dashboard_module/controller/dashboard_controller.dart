import 'package:beere_mobile/modules/cart_module/view/cart_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/home_page.dart';
import 'package:beere_mobile/modules/profile_module/view/profile_view.dart';
import 'package:beere_mobile/modules/settings_module/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class DashboardController extends GetxController {
  final RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  set selectedIndex(int value) => _selectedIndex.value = value;
  final PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      HomePage(),
      const ProfileView(),
      const CartView(),
      const SettingsView(),
    ];
  }
}
