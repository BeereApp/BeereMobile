import 'dart:io';

import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/models/profile_model.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/extensions.dart';
import 'package:beere_mobile/widgets/select_image_dialog.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class VendorProfileController extends GetxController {
  final _dateController = TextEditingController().obs;

  TextEditingController get dateController => _dateController.value;

  set dateController(TextEditingController value) =>
      _dateController.value = value;

  final GlobalKey<FormState> personalFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> businessFormKey = GlobalKey<FormState>();
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

  final RxBool _isUpdating = false.obs;

  bool get isUpdating => _isUpdating.value;

  set isUpdating(bool value) => _isUpdating.value = value;

  Rx<File?> personalImage = Rx<File?>(null);
  Rx<File?> personalBackgroundImage = Rx<File?>(null);
  Rx<File?> businessImage = Rx<File?>(null);
  Rx<File?> businessBackgroundImage = Rx<File?>(null);

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
  final Rx<DateTime?> _date = Rx<DateTime?>(null);
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

  DateTime? get date => _date.value;

  set date(DateTime? value) => _date.value = value;

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
    FocusManager.instance.primaryFocus?.unfocus();
    if (!personalFormKey.currentState!.validate()) return;
    var model = this
        .model!
        .copyWith(firstname: firstName, lastname: lastName, phone: phone);

    if (address.isNotEmpty) {
      model = model.copyWith(homeAddress: address);
    }
    if (whatsapp.isNotEmpty) {
      model = model.copyWith(whatsapp: whatsapp);
    }
    final body = model.toMap();
    final files = <http.MultipartFile>[];
    if (personalImage.value != null) {
      final file = personalImage.value!;
      files.add(await http.MultipartFile.fromPath('personal_image', file.path,
          filename: file.fileName,
          contentType: MediaType.parse(file.contentType)));
    }
    if (personalBackgroundImage.value != null) {
      final file = personalBackgroundImage.value!;
      files.add(await http.MultipartFile.fromPath(
          'personal_background_image', file.path,
          filename: file.fileName,
          contentType: MediaType.parse(file.contentType)));
    }
    try {
      isUpdating = true;
      await APIService()
          .updateVendorProfile(body, files, id: model.id.toString());
      getProfile();
      personalImage.value = null;
      personalBackgroundImage.value = null;
    } catch (e) {
      debugPrint(e.toString());
      CustomSnackBar.showGet(
          title: 'Error!',
          content: e.toString(),
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
    } finally {
      editPersonalInfo = false;
      isUpdating = false;
    }
  }

  Future<void> updateBusinessInfo() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!businessFormKey.currentState!.validate()) return;
    var model = this.model!.copyWith(
          companyRegisteredName: companyRegisteredName,
          companyAddress: companyAddress,
          companyPhone: companyPhone,
        );
    if (tin.isNotEmpty) {
      model = model.copyWith(tin: tin);
    }
    if (cacNumber.isNotEmpty) {
      model = model.copyWith(cacNumber: cacNumber);
    }
    if (companyEmail.isNotEmpty) {
      model = model.copyWith(companyEmail: companyEmail);
    }
    if (officePhone.isNotEmpty) {
      model = model.copyWith(officePhone: officePhone);
    }
    if (date != null) {
      model = model.copyWith(dateOfEstablishment: date);
    }
    final body = model.toMap();
    final files = <http.MultipartFile>[];
    if (businessImage.value != null) {
      final file = businessImage.value!;
      files.add(await http.MultipartFile.fromPath('business_image', file.path,
          filename: file.fileName,
          contentType: MediaType.parse(file.contentType)));
    }
    if (businessBackgroundImage.value != null) {
      final file = businessBackgroundImage.value!;
      files.add(await http.MultipartFile.fromPath(
          'business_background_image', file.path,
          filename: file.fileName,
          contentType: MediaType.parse(file.contentType)));
    }
    try {
      isUpdating = true;
      await APIService()
          .updateVendorProfile(body, files, id: model.id.toString());
      getProfile();
      businessImage.value = null;
      businessBackgroundImage.value = null;
    } catch (e) {
      debugPrint(e.toString());
      CustomSnackBar.showGet(
          title: 'Error!',
          content: e.toString(),
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
    } finally {
      editBusinessInfo = false;
      isUpdating = false;
    }
  }

  void setData(VendorProfileModel model) {
    firstName = model.firstname;
    lastName = model.lastname;
    phone = model.phone;
    address = model.homeAddress ?? '';
    whatsapp = model.whatsapp ?? '';
    companyAddress = model.companyAddress;
    companyRegisteredName = model.companyRegisteredName;
    tin = model.tin ?? '';
    cacNumber = model.cacNumber ?? '';
    companyPhone = model.companyPhone;
    date = model.dateOfEstablishment;
    dateController.text =
        date != null ? DateFormat('dd - MM - y').format(date!) : '';
    companyEmail = model.companyEmail ?? '';
    officePhone = model.officePhone ?? '';
  }

  Future<void> chooseDate() async {
    DateTime now = DateTime.now();
    await showDatePicker(
            context: Get.context!,
            initialDate: date ?? now,
            firstDate: DateTime(now.year - 100, 1),
            lastDate: DateTime(now.year + 1, 12))
        .then((value) {
      if (value != null) {
        date = value;
        dateController.text = DateFormat('dd - MM - y').format(value);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    getProfile();
  }

  void selectProfileImage(BuildContext context) {
    if (index == 0 && !editPersonalInfo) return;
    if (index == 1 && !editBusinessInfo) return;
    showDialog(context: context, builder: (_) => const SelectImageDialog())
        .then((value) async {
      if (value == 'gallery') {
        File? image = await pickImage(source: ImageSource.gallery);
        if (image != null) {
          index == 0
              ? personalImage.value = image
              : businessImage.value = image;
        }
      }
      if (value == 'camera') {
        File? image = await pickImage(source: ImageSource.camera);
        if (image != null) {
          index == 0
              ? personalImage.value = image
              : businessImage.value = image;
        }
      }
    });
  }

  void selectBackgroundImage(BuildContext context) {
    showDialog(context: context, builder: (_) => const SelectImageDialog())
        .then((value) async {
      if (value == 'gallery') {
        File? image = await pickImage(source: ImageSource.gallery);
        if (image != null) {
          index == 0
              ? personalBackgroundImage.value = image
              : businessBackgroundImage.value = image;
        }
      }
      if (value == 'camera') {
        File? image = await pickImage(source: ImageSource.camera);
        if (image != null) {
          index == 0
              ? personalBackgroundImage.value = image
              : businessBackgroundImage.value = image;
        }
      }
    });
  }

  bool get topColorCondition {
    return ((index == 0 &&
                (personalBackgroundImage.value == null &&
                    model?.personalBackgroundImage == null)) ||
            (index == 1 &&
                (businessBackgroundImage.value == null &&
                    model?.businessBackgroundImage == null)))
        ? true
        : false;
  }
}
