import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/modules/cart_module/view/cart_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/home.dart';
import 'package:beere_mobile/modules/home_page_module/view/home_page.dart';
import 'package:beere_mobile/modules/profile_module/view/profile_view.dart';
import 'package:beere_mobile/modules/settings_module/view/settings_view.dart';
import 'package:beere_mobile/modules/vendor/business_module/view/vendor_promotion_list_view.dart';
import 'package:beere_mobile/modules/vendor/home_page_module/view/vendor_home_page.dart';
import 'package:beere_mobile/modules/vendor/profile_module/view/vendor_profile_view.dart';
import 'package:beere_mobile/utils/enum.dart';
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
      usertype == UserType.user ? HomePage() : const VendorHomePage(),
      usertype == UserType.user
          ? const ProfileView()
          : const VendorProfileView(),
      usertype == UserType.user
          ? const CartView()
          : const VendorPromotionListView(),
      const SettingsView(),
    ];
  }
}
