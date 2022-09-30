import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/modules/onboarding_module/view/login_view.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:get/get.dart';

class SelectCategoryController extends GetxController {
  //User type is 1 for user,
  //User type is 2 for vendor,
  //User type is 3 for manufacturer,
  //User type is 4 for super admin
  void gotoUserPage() {
    usertype = UserType.user;
    Get.toNamed(LoginView.route, arguments: {'user_type': 1});
  }

  void gotoVendorPage() {
    usertype = UserType.vendor;
    Get.toNamed(LoginView.route, arguments: {'user_type': 2});
  }

  void gotoManufacturerPage() {
    usertype = UserType.manufacturer;
    Get.toNamed(LoginView.route, arguments: {'user_type': 3});
  }
}
