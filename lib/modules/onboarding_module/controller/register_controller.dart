import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/modules/onboarding_module/view/verify_otp_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/app_data.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verify_otp_controller.dart';

class RegisterController extends GetxController {
  final AppData _appData = AppData();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool _isProcessing = false.obs;

  final RxString _firstName = ''.obs;
  final RxString _lastName = ''.obs;
  final RxString _email = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _password = ''.obs;
  final RxBool _passwordVisibility = true.obs;
  final RxString _confirmPassword = ''.obs;
  final RxBool _confirmPasswordVisibility = true.obs;
  final Rx<String?> _ageRange = Rx<String?>(null);
  final Rx<String?> _gender = Rx<String?>(null);

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  String get firstName => _firstName.value;

  set firstName(String value) => _firstName.value = value;

  String get lastName => _lastName.value;

  set lastName(String value) => _lastName.value = value;

  String get email => _email.value;

  set email(String value) => _email.value = value;

  String get phone => _phone.value;

  set phone(String value) => _phone.value = value;

  String get password => _password.value;

  set password(String value) => _password.value = value;

  bool get passwordVisibility => _passwordVisibility.value;

  set passwordVisibility(bool value) => _passwordVisibility.value = value;

  String get confirmPassword => _confirmPassword.value;

  set confirmPassword(String value) => _confirmPassword.value = value;

  bool get confirmPasswordVisibility => _confirmPasswordVisibility.value;

  set confirmPasswordVisibility(bool value) =>
      _confirmPasswordVisibility.value = value;

  String? get ageRange => _ageRange.value;

  set ageRange(String? value) => _ageRange.value = value;

  String? get gender => _gender.value;

  set gender(String? value) => _gender.value = value;

  bool get enabled =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      email.isNotEmpty &&
      phone.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      gender != null &&
      ageRange != null;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    Map<String, dynamic> body = {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'age': ageRange,
      'gender': gender,
      'phone': phone,
      'password': password,
      'password_confirmed': confirmPassword
    };
    try {
      isProcessing = true;
      final model = await APIService().registerUser(body);

      //_appData.storeToken(model.token);
      _appData.storePhone(phone);
      Get.toNamed(VerifyOTPView.route, arguments: VerifyOTPArguments(phone));
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
