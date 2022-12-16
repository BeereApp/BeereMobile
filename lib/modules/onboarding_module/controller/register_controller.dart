import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/models/state_model.dart';
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

  final Rx<String?> _state = Rx<String?>(null);
  final Rx<String?> _lga = Rx<String?>(null);
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

  String? get state => _state.value;

  set state(String? value) => _state.value = value;

  String? get lga => _lga.value;

  set lga(String? value) => _lga.value = value;

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

  final states = <StateModel>[].obs;
  final listOfStates = <String>[].obs;
  final listOfLgas = <String>[].obs;

  bool get enabled =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      email.isNotEmpty &&
      phone.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      gender != null &&
      ageRange != null &&
      state != null &&
      lga != null;

  Future<void> register() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKey.currentState!.validate()) return;

    Map<String, dynamic> body = {
      'firstname': firstName.trim(),
      'lastname': lastName.trim(),
      'email': email.trim(),
      'age': ageRange,
      'gender': gender,
      'phone': phone,
      'password': password,
      'password_confirmed': confirmPassword,
      'state': state ?? '',
      'lga': lga ?? '',
    };
    // if (position != null) {
    //   body.addAll({
    //     'lat': position!.latitude,
    //     'lng': position!.longitude,
    //   });
    // }
    try {
      isProcessing = true;
      final model = await APIService().registerUser(body);
      _appData.storeToken(model.token);
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

  Future<void> fetchStates() async {
    try {
      final response = await APIService().getStates();
      states.assignAll(response);
      populateStates();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void populateStates() {
    listOfStates
        .assignAll(states.map((element) => element.state.name).toList());
  }

  void populateLga(String state) {
    final list = states
        .firstWhere((element) => element.state.name == state)
        .state
        .locals;
    listOfLgas.assignAll(list.map((e) => e.name).toList());
  }

  @override
  void onReady() {
    super.onReady();
    fetchStates();
    // if (position == null) {
    //   getCurrentLocation();
    // }
  }
}
