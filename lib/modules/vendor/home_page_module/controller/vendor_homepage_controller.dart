import 'package:beere_mobile/modules/vendor/home_page_module/view/vendor_search_view.dart';
import 'package:get/get.dart';

class VendorHomePageController extends GetxController {
  void search() {
    Get.toNamed(VendorSearchView.route);
  }
}
