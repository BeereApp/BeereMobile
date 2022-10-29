import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/modules/onboarding_module/view/change_password_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final RxString _password = ''.obs;
  final RxBool _passwordVisibility = true.obs;
  final RxString _confirmPassword = ''.obs;
  final RxBool _confirmPasswordVisibility = true.obs;
  final RxString _otp = ''.obs;
  final RxString _email = ''.obs;
  final RxBool _isProcessing = false.obs;

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  String get email => _email.value;

  set email(String value) => _email.value = value;

  String get otp => _otp.value;

  set otp(String value) => _otp.value = value;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  String get password => _password.value;

  set password(String value) => _password.value = value;

  bool get passwordVisibility => _passwordVisibility.value;

  set passwordVisibility(bool value) => _passwordVisibility.value = value;

  String get confirmPassword => _confirmPassword.value;

  set confirmPassword(String value) => _confirmPassword.value = value;

  bool get confirmPasswordVisibility => _confirmPasswordVisibility.value;

  set confirmPasswordVisibility(bool value) =>
      _confirmPasswordVisibility.value = value;

  Future<void> forgotPassword() async {
    if (!formKey1.currentState!.validate()) return;
    Map<String, dynamic> body = {
      'email_phone': email,
    };
    try {
      isProcessing = true;
      final response = await APIService().forgotPassword(body);
      if (response) {
        Get.toNamed(ChangePasswordView.route);
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

  Future<void> resetPassword() async {
    if (!formKey2.currentState!.validate()) return;
    Map<String, dynamic> body = {
      'password': password,
      'confirm_password': confirmPassword,
      'user_type': usertype == UserType.user ? 1 : 2,
      'token': otp,
    };
    try {
      isProcessing = true;
      final response = await APIService().resetPassword(body);
      if (response) {
        Get.back();
        Get.back();
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

  double passwordStrength() {
    double val = 0;
    if (password.length > 5) {
      val += 2;
    }
    if (password.length > 9) {
      val += 2;
    }
    if (password.contains(RegExp(r"[0-9]")) && password.length > 5) {
      val += 2;
    }
    if (password.contains(RegExp(r"[a-z]")) &&
        password.contains(RegExp(r"[A-Z]")) &&
        password.length > 5) {
      val += 2;
    }
    if (password.contains(RegExp(r'[^A-Za-z0-9]')) && password.length > 5) {
      val += 2;
    }
    return val;
  }
}
