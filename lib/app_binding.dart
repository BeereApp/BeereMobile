import 'package:beere_mobile/modules/onboarding_module/controller/home_page_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put(HomePageController(), permanent: true);
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
