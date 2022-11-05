import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/models/vendor_profile_model.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VendorProfileController extends GetxController {
  final _dateController = TextEditingController().obs;

  TextEditingController get dateController => _dateController.value;
  set dateController(TextEditingController value) =>
      _dateController.value = value;

  //0 for Personal Info
  //1 for Business Info
  final RxInt _index = 0.obs;
  set index(int value) => _index.value = value;
  int get index => _index.value;

  final _editPersonalInfo = false.obs;
  final _editBusinessInfo = false.obs;

  bool get editPersonalInfo => _editPersonalInfo.value;
  set editPersonalInfo(bool value) => _editPersonalInfo.value = value;
  bool get editBusinessInfo => _editBusinessInfo.value;
  set editBusinessInfo(bool value) => _editBusinessInfo.value = value;

  final RxBool _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  final RxString _firstName = ''.obs;
  final RxString _lastName = ''.obs;
  final RxString _address = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _whatsapp = ''.obs;
  final RxString _companyAddress = ''.obs;
  final RxString _companyRegisteredName = ''.obs;
  final RxString _tin = ''.obs;
  final RxString _cacNumber = ''.obs;
  final RxString _companyPhone = ''.obs;
  final Rx<DateTime> _date = DateTime.now().obs;
  final RxString _companyEmail = ''.obs;
  final RxString _officePhone = ''.obs;

  String get firstName => _firstName.value;

  set firstName(String value) => _firstName.value = value;

  String get lastName => _lastName.value;

  set lastName(String value) => _lastName.value = value;

  String get address => _address.value;

  set address(String value) => _address.value = value;

  String get phone => _phone.value;

  set phone(String value) => _phone.value = value;

  String get whatsapp => _whatsapp.value;

  set whatsapp(String value) => _whatsapp.value = value;

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

  DateTime get date => _date.value;

  set date(DateTime value) => _date.value = value;

  String get companyEmail => _companyEmail.value;

  set companyEmail(String value) => _companyEmail.value = value;

  String get officePhone => _officePhone.value;

  set officePhone(String value) => _officePhone.value = value;

  final Rx<VendorProfileModel?> _model = Rx<VendorProfileModel?>(null);

  VendorProfileModel? get model => _model.value;
  set model(VendorProfileModel? value) => _model.value = value;

  Future<void> getProfile() async {
    try {
      isProcessing = true;
      final model = await APIService().getVendorProfile();
      this.model = model;
      setData(model);
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

  Future<void> updatePersonalInfo() async {
    editPersonalInfo = false;
  }

  Future<void> updateBusinessInfo() async {
    editBusinessInfo = false;
  }

  void setData(VendorProfileModel model) {
    firstName = model.firstname;
    lastName = model.lastname;
    phone = model.phone;
    //address = model.address;
    //whatsapp = model.whatsapp;
    companyAddress = model.companyAddress;
    companyRegisteredName = model.companyRegisteredName;
    tin = model.tin ?? '';
    cacNumber = model.cacNumber ?? '';
    companyPhone = model.companyPhone;
    //date = model.dateOfEstablishment;
    dateController.text = DateFormat('dd - MM - y').format(date);
    //companyEmail = model.companyEmail;
    //officePhone = model.officePhone;
  }

  Future<void> chooseDate() async {
    DateTime now = DateTime.now();
    await showDatePicker(
            context: Get.context!,
            initialDate: date,
            firstDate: DateTime(now.year - 100, 1),
            lastDate: DateTime(now.year + 1, 12))
        .then((value) {
      if (value != null) {
        date = value;
        dateController.text = DateFormat('dd - MM - y').format(date);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    getProfile();
  }
}
