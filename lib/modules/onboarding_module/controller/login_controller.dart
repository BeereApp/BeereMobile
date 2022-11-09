import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/models/vendor_login_model.dart';
import 'package:beere_mobile/modules/dashboard_module/view/dashboard_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/forgot_password_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/register_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/verify_otp_view.dart';
import 'package:beere_mobile/modules/vendor/onboarding_module/controller/vendor_register_controller.dart';
import 'package:beere_mobile/modules/vendor/onboarding_module/view/vendor_register_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/app_data.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'verify_otp_controller.dart';

class LoginController extends GetxController {
  final AppData _appData = AppData();

  VendorLoginModel? vendorModel;
  final RxString _email = ''.obs;
  final RxString _password = ''.obs;
  final RxBool _passwordVisibility = true.obs;
  final RxBool _isProcessing = false.obs;
  final RxBool _isError = false.obs;
  final RxString _errorText = 'Error: Invalid Email or Password'.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String get email => _email.value;

  set email(String value) => _email.value = value;

  String get password => _password.value;

  set password(String value) => _password.value = value;

  bool get passwordVisibility => _passwordVisibility.value;

  set passwordVisibility(bool value) => _passwordVisibility.value = value;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  bool get isError => _isError.value;

  set isError(bool value) => _isError.value = value;

  String get errorText => _errorText.value;
  set errorText(String value) => _errorText.value = value;

  void forgotPassword() {
    Get.toNamed(ForgotPasswordView.route);
  }

  void gotoRegisterPage() {
    if (usertype == UserType.user) {
      Get.toNamed(RegisterView.route);
    }
    if (usertype == UserType.vendor) {
      Get.toNamed(VendorRegisterView.route,
          arguments: VendorRegisterArguments(1));
    }
  }

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKey.currentState!.validate()) return;

    try {
      isProcessing = true;
      isError = false;
      Map<String, dynamic> body = {
        'email': email,
        'password': password,
      };
      if (usertype == UserType.user) {
        final model = await APIService().login(body);
      }
      if (usertype == UserType.vendor) {
        final model = await APIService().loginVendor(body);
        vendorModel = model;
        _appData.storeToken(model.data.token);
        _handleRedirect(model);
      }
    } catch (e) {
      isError = true;
      debugPrint(e.toString());
      String error = e.toString();
      if (e.toString().contains('verify')) {
        error = errorText = 'Please verify your phone number before continuing';
        Future.delayed(const Duration(seconds: 1), () {
          Get.toNamed(VerifyOTPView.route,
              arguments: VerifyOTPArguments(_appData.phone));
        });
      }
      CustomSnackBar.showGet(
          title: 'Error!',
          content: error,
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
    } finally {
      isProcessing = false;
    }
  }

  void _handleRedirect(VendorLoginModel model) {
    if (model.data.user.profileCompleted) {
      Get.offAllNamed(DashboardView.route);
    } else {
      Get.toNamed(VendorRegisterView.route,
          arguments: VendorRegisterArguments(2));
    }
  }
}
