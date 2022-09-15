import 'package:beere_mobile/modules/onboarding_module/view/login_view.dart';
import 'package:get/get.dart';

class SelectCategoryController extends GetxController {
  //User type is 1 for user,
  //User type is 2 for vendor,
  //User type is 3 for manufacturer,
  //User type is 4 for super admin
  void gotoUserPage() {
    Get.toNamed(LoginView.route, arguments: {'user_type': 1});
  }

  void gotoVendorPage() {
    Get.toNamed(LoginView.route, arguments: {'user_type': 2});
  }

  void gotoManufacturerPage() {
    Get.toNamed(LoginView.route, arguments: {'user_type': 3});
  }
}
