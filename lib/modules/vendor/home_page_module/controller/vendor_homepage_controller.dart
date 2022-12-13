import 'package:beere_mobile/modules/vendor/home_page_module/view/vendor_search_view.dart';
import 'package:beere_mobile/modules/vendor/profile_module/controller/vendor_profile_controller.dart';
import 'package:get/get.dart';

class VendorHomePageController extends GetxController {
  void search() {
    Get.toNamed(VendorSearchView.route);
  }

  late VendorProfileController profile;

  @override
  void onInit() {
    super.onInit();
    profile = Get.put(VendorProfileController());
  }
}
