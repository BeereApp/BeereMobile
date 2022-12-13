import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/config.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/models/location_model.dart';
import 'package:beere_mobile/models/place_model.dart';
import 'package:beere_mobile/models/state_model.dart';
import 'package:beere_mobile/modules/vendor/profile_module/view/vendor_add_location_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class VendorLocationController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final officeAddressController = TextEditingController().obs;
  final officeAddressNode = FocusNode();
  final _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  final _isEdit = false.obs;

  bool get isEdit => _isEdit.value;

  set isEdit(bool value) => _isEdit.value = value;
  int editId = 0;
  String sessionToken = 'BE$randomKey';
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
    if (position == null) {
      CustomSnackBar.showGet(
          title: 'Info!',
          content:
              'We are unable to get your location, please enable location settings on'
              ' your device and grant permission to use it.',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      getCurrentLocation();
      return;
    }
    listenForFocus();
    isEdit = false;
    officeAddressController.value.text = '';
    places = null;
    Get.toNamed(VendorAddLocationView.route);
  }

  void gotoEditLocation(LocationModel model) {
    if (position == null) {
      CustomSnackBar.showGet(
          title: 'Info!',
          content:
              'We are unable to get your location, please enable location settings on'
              ' your device and grant permission to use it.',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      getCurrentLocation();
      return;
    }
    listenForFocus();
    isEdit = true;
    editId = model.id;
    state = model.state;
    lga = model.lga;
    email = model.email;
    whatsapp = model.whatsappContact;
    officeAddress = model.officeAddress;
    officeAddressController.value.text = model.officeAddress;
    homeAddress = model.homeAddress ?? '';
    otherContact = model.otherContact ?? '';
    populateLga(model.state);
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
    isProcessing = true;
    final location = await locationFromAddress(officeAddress);
    double lat;
    double lng;
    if (location.isNotEmpty) {
      lat = location[0].latitude;
      lng = location[0].longitude;
    } else {
      lat = position!.latitude;
      lng = position!.longitude;
    }
    Map<String, dynamic> body = {
      'email': email,
      'state': state ?? '',
      'lga': lga ?? '',
      'whatsapp_contact': whatsapp,
      'office_address': officeAddress,
      'home_address': homeAddress,
      'other_contact': otherContact,
      'lat': lat,
      'lng': lng,
    };
    try {
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
          otherContact: otherContact,
          lat: lat,
          lng: lng,
          isDefault: false,
        ));
        cancelListener();
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

  Future<void> editLocation() async {
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
      final response = await APIService().updateLocation(body, editId);
      if (response) {
        int index = locations.indexWhere((e) => e.id == editId);
        locations[index] = LocationModel(
          id: editId,
          email: email,
          state: state ?? '',
          lga: lga ?? '',
          whatsappContact: whatsapp,
          officeAddress: officeAddress,
          homeAddress: homeAddress,
          otherContact: otherContact,
          lat: locations[index].lat,
          lng: locations[index].lng,
          isDefault: locations[index].isDefault,
        );
        cancelListener();
        Get.back();
        CustomSnackBar.showGet(
            title: 'Success!',
            content: 'Location data edited successfully.',
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

  Future<void> setDefaultLocation(LocationModel model) async {}

  void resetFields() {
    state = null;
    lga = null;
    listOfLgas.assignAll([]);
    email = '';
    whatsapp = '';
    officeAddress = '';
    officeAddressController.value.text = '';
    homeAddress = '';
    otherContact = '';
    sessionToken = 'BE$randomKey';
  }

  final Rx<PlaceModel?> _places = Rx<PlaceModel?>(null);

  PlaceModel? get places => _places.value;

  set places(PlaceModel? value) => _places.value = value;

  Future<void> autocomplete() async {
    Map<String, dynamic> params = {
      'input': officeAddress,
      'sessiontoken': sessionToken,
      'components': 'country:ng',
      'location': '${position!.latitude},${position!.longitude}',
      'radius': '50000',
      'key': apiKey,
    };
    try {
      final response = await APIService().findPlaces(params);
      places = response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setAddress(String text) {
    FocusManager.instance.primaryFocus?.unfocus();
    officeAddress = text;
    officeAddressController.value.text = text;
    places = null;
    scrolled = false;
  }

  void listenForFocus() {
    officeAddressNode.addListener(() {
      if (!officeAddressNode.hasFocus) {
        places = null;
      }
    });
  }

  void cancelListener() {
    officeAddressNode.removeListener(() {});
  }

  bool scrolled = false;
  void scrollUp() {
    if (scrolled) return;
    scrolled = true;
    scrollController.animateTo(scrollController.offset + 250,
        curve: Curves.easeOut, duration: const Duration(milliseconds: 300));
  }

  @override
  void onReady() {
    super.onReady();
    fetchStates();
    getLocations();
  }
}
