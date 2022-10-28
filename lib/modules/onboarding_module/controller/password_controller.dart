import 'package:beere_mobile/modules/onboarding_module/view/change_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final RxString _email = ''.obs;
  final RxBool _isProcessing = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String get email => _email.value;

  set email(String value) => _email.value = value;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  Future<void> forgotPassword() async {
    if (!formKey.currentState!.validate()) return;
    Map<String, dynamic> body = {
      'email': email,
    };

    Get.toNamed(ChangePasswordView.route);
  }
}
