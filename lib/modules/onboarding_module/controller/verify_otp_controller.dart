import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/modules/dashboard_module/view/dashboard_view.dart';
import 'package:beere_mobile/modules/vendor/onboarding_module/controller/vendor_register_controller.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  final _otp = ''.obs;
  String get otp => _otp.value;
  set otp(String value) => _otp.value = value;

  void verifyOTP() {
    if (usertype == UserType.user) {
      Get.offAllNamed(DashboardView.route);
    }
    if (usertype == UserType.vendor) {
      Get.back();
      Get.find<VendorRegisterController>().currentStep = 2;
    }
  }
}
