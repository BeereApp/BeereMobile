import 'package:beere_mobile/widgets/text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TabsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "Store Stat",
    ),
    Tab(
      text: "Location Stat",
    )
  ];

  late TabController controller;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}
