import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/models/location_model.dart';
import 'package:beere_mobile/models/state_model.dart';
import 'package:beere_mobile/modules/vendor/profile_module/view/vendor_add_location_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorLocationController extends GetxController {
  final _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<String?> _state = Rx<String?>(null);
  final Rx<String?> _lga = Rx<String?>(null);
  final _email = ''.obs;
  final _whatsapp = ''.obs;
  final _officeAddress = ''.obs;
  final _homeAddress = ''.obs;
  final _otherContact = ''.obs;

  String? get state => _state.value;

  set state(String? value) => _state.value = value;

  String? get lga => _lga.value;

  set lga(String? value) => _lga.value = value;

  String get email => _email.value;

  set email(String value) => _email.value = value;

  String get whatsapp => _whatsapp.value;

  set whatsapp(String value) => _whatsapp.value = value;

  String get officeAddress => _officeAddress.value;

  set officeAddress(String value) => _officeAddress.value = value;

  String get homeAddress => _homeAddress.value;

  set homeAddress(String value) => _homeAddress.value = value;

  String get otherContact => _otherContact.value;

  set otherContact(String value) => _otherContact.value = value;

  final locations = <LocationModel>[].obs;

  void gotoAddLocation() {
    Get.toNamed(VendorAddLocationView.route);
  }

  final states = <StateModel>[].obs;
  final listOfStates = <String>[].obs;
  final listOfLgas = <String>[].obs;

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

  Future<void> getLocations() async {
    try {
      isProcessing = true;
      final response = await APIService().getLocations();
      locations.assignAll(response);
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

  Future<void> saveLocation() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (state == null || lga == null) {
      CustomSnackBar.showGet(
          title: 'Info!',
          content: 'State and Lga are required',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      return;
    }
    if (!formKey.currentState!.validate()) return;
    Map<String, dynamic> body = {
      'email': email,
      'state': state ?? '',
      'lga': lga ?? '',
      'whatsapp_contact': whatsapp,
      'office_address': officeAddress,
      'home_address': homeAddress,
      'other_contact': otherContact,
    };
    try {
      isProcessing = true;
      final response = await APIService().addLocation(body);
      if (response['status']) {
        locations.add(LocationModel(
            id: response['id'],
            email: email,
            state: state ?? '',
            lga: lga ?? '',
            whatsappContact: whatsapp,
            officeAddress: officeAddress,
            homeAddress: homeAddress,
            otherContact: otherContact));
        Get.back();
        CustomSnackBar.showGet(
            title: 'Success!',
            content: 'Location data added successfully.',
            backgroundColor: kPrimaryGreen,
            textColor: kWhite);
        resetFields();
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

  void resetFields() {
    state = null;
    lga = null;
    listOfLgas.assignAll([]);
    email = '';
    whatsapp = '';
    officeAddress = '';
    homeAddress = '';
    otherContact = '';
  }

  @override
  void onReady() {
    super.onReady();
    fetchStates();
    getLocations();
  }
}
