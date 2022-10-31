import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/modules/dashboard_module/view/dashboard_view.dart';
import 'package:beere_mobile/modules/vendor/onboarding_module/controller/vendor_register_controller.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  final VerifyOTPArguments args;

  VerifyOTPController(this.args);

  final RxString _otp = ''.obs;
  final RxBool _isProcessing = false.obs;

  String get otp => _otp.value;

  set otp(String value) => _otp.value = value;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  late final String _phone;

  @override
  void onInit() {
    super.onInit();
    _phone = args.phone;
  }

  Future<void> verifyOTP() async {
    bool hasInternet = await checkForInternet();
    if (!hasInternet) {
      CustomSnackBar.showGet(
          title: 'Error!',
          content: 'No Internet Connection',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      return;
    }
    Map<String, dynamic> body = {
      'phone': _phone,
      'otp': otp,
    };
    try {
      isProcessing = true;

      if (usertype == UserType.user) {
        final response = await APIService().verifyPhone(body);
        if (response) {
          Get.offAllNamed(DashboardView.route);
        }
      }
      if (usertype == UserType.vendor) {
        final response = await APIService().verifyVendor(body);
        if (response) {
          Get.back();
          Get.find<VendorRegisterController>().currentStep = 2;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      CustomSnackBar.showGet(
          title: 'Error!',
          content: e.toString(),
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
    } finally {
      isProcessing = false;
    }
  }
}

class VerifyOTPArguments {
  final String phone;

  VerifyOTPArguments(this.phone);
}
