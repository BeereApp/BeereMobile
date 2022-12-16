import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/models/category_model.dart';
import 'package:beere_mobile/models/register_model.dart';
import 'package:beere_mobile/modules/onboarding_module/controller/login_controller.dart';
import 'package:beere_mobile/modules/onboarding_module/view/verify_otp_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/app_data.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../onboarding_module/controller/verify_otp_controller.dart';

class VendorRegisterController extends GetxController {
  final VendorRegisterArguments args;

  VendorRegisterController(this.args);
  final ScrollController businessScrollController = ScrollController();
  final RxBool _scrolled = false.obs;

  bool get scrolled => _scrolled.value;

  set scrolled(bool value) => _scrolled.value = value;
  final AppData _appData = AppData();
  VendorRegisterModel? vendorModel;
  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final RxBool _isProcessing = false.obs;

  final RxString _firstName = ''.obs;
  final RxString _lastName = ''.obs;
  final RxString _email = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _password = ''.obs;
  final RxBool _passwordVisibility = true.obs;
  final RxString _confirmPassword = ''.obs;
  final RxBool _confirmPasswordVisibility = true.obs;
  final Rx<String?> _userType = Rx<String?>(null);
  final RxString _companyAddress = ''.obs;

  final RxString _companyRegisteredName = ''.obs;
  final RxString _tin = ''.obs;
  final RxString _cacNumber = ''.obs;
  final RxString _companyPhone = ''.obs;
  final RxBool _isManufacturer = false.obs;
  final RxString _accountName = ''.obs;
  final RxString _accountNumber = ''.obs;
  final RxString _bankName = ''.obs;
  final TextEditingController sellerIdController = TextEditingController();

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

  String? get userType => _userType.value;

  set userType(String? value) => _userType.value = value;

  String get companyAddress => _companyAddress.value;

  set companyAddress(String value) => _companyAddress.value = value;

  String get companyRegisteredName => _companyRegisteredName.value;

  set companyRegisteredName(String value) =>
      _companyRegisteredName.value = value;

  String get tin => _tin.value;

  set tin(String value) => _tin.value = value;

  String get cacNumber => _cacNumber.value;

  set cacNumber(String value) => _cacNumber.value = value;

  String get companyPhone => _companyPhone.value;

  set companyPhone(String value) => _companyPhone.value = value;

  bool get isManufacturer => _isManufacturer.value;

  set isManufacturer(bool value) => _isManufacturer.value = value;

  String get accountName => _accountName.value;

  set accountName(String value) => _accountName.value = value;

  String get accountNumber => _accountNumber.value;

  set accountNumber(String value) => _accountNumber.value = value;

  String get bankName => _bankName.value;

  set bankName(String value) => _bankName.value = value;

  final RxInt _currentStep = 1.obs;
  final RxBool _termsCheckBox = false.obs;

  set currentStep(int value) => _currentStep.value = value;

  int get currentStep => _currentStep.value;

  set termsCheckBox(bool value) => _termsCheckBox.value = value;

  bool get termsCheckBox => _termsCheckBox.value;

  final selectedCategoryList = <String>[].obs;
  final List<String> categoryList = <String>[].obs;

  bool get enabled1 =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      email.isNotEmpty &&
      phone.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      userType != null &&
      termsCheckBox;

  Future<void> register() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKeys[0].currentState!.validate()) return;

    Map<String, dynamic> body = {
      'firstname': firstName.trim(),
      'lastname': lastName.trim(),
      'email': email.trim(),
      'business_type': userType,
      'phone': phone,
      'password': password,
      'confirm_password': confirmPassword
    };
    try {
      isProcessing = true;
      final model = await APIService().registerVendor(body);
      vendorModel = model;
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

  void nextStep() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKeys[currentStep - 1].currentState!.validate()) return;
    currentStep++;
  }

  void previousStep() {
    FocusManager.instance.primaryFocus?.unfocus();
    currentStep--;
  }

  Future<void> updateInfo() async {
    FocusManager.instance.primaryFocus?.unfocus();
    List<int> category = [];
    for (var element in categories) {
      if (selectedCategoryList.contains(element.title)) {
        category.add(element.id);
      }
    }
    Map<String, dynamic> body = {
      'company_registered_name': companyRegisteredName.trim(),
      'company_address': companyAddress.trim(),
      'company_phone': companyPhone,
      'account_number': accountNumber,
      'is_manufacturer': isManufacturer,
      'account_name': accountName.trim(),
      'bank_name': bankName.trim(),
      'seller_id': sellerIdController.text,
      'category': category,
    };
    if (tin.isNotEmpty) {
      body['tin'] = tin.trim();
    }
    if (cacNumber.isNotEmpty) {
      body['cac_number'] = cacNumber.trim();
    }
    try {
      isProcessing = true;
      final response = await APIService().updateVendorInfo(body,
          id: vendorModel?.data.id.toString() ??
              Get.find<LoginController>().vendorModel!.data.user.id.toString());
      if (response) {
        currentStep++;
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

  final RxBool _isGettingCategories = false.obs;

  bool get isGettingCategories => _isGettingCategories.value;

  List<Category> categories = [];

  set isGettingCategories(bool value) => _isGettingCategories.value = value;

  Future<void> fetchCategories() async {
    try {
      isGettingCategories = true;
      final list = await APIService().getCategories();
      categories = list;
      categoryList.assignAll(list.map((e) => e.title).toList());
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isGettingCategories = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    currentStep = args.step;
    sellerIdController.text = 'BE$randomKey';
    fetchCategories();
  }
}

class VendorRegisterArguments {
  final int step;

  VendorRegisterArguments(this.step);
}
