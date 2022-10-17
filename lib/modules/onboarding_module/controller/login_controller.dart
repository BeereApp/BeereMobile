import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/modules/onboarding_module/view/forgot_password_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/register_view.dart';
import 'package:beere_mobile/modules/vendor/onboarding_module/view/vendor_register_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final passwordVisibility = false.obs;
  final isProcessing = false.obs;
  final isError = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void forgotPassword() {
    Get.toNamed(ForgotPasswordView.route);
  }

  void gotoRegisterPage() {
    if (usertype == UserType.user) {
      Get.toNamed(RegisterView.route);
    }
    if (usertype == UserType.vendor) {
      Get.toNamed(VendorRegisterView.route);
    }
  }

  Future<void> login() async {
    bool hasInternet = await checkForInternet();
    if (!hasInternet) {
      CustomSnackBar.showGet(
          title: 'Error!',
          content: 'No Internet Connection',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      return;
    }
    isProcessing.value = true;
    isError.value = false;
  }
}
