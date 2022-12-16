import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/models/category_model.dart';
import 'package:beere_mobile/models/search_model.dart';
import 'package:beere_mobile/models/state_model.dart';
import 'package:beere_mobile/modules/home_page_module/controller/home_page_controller.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class UserSearchController extends GetxController {
  final _selectedCategory = (-1).obs;

  int get selectedCategory => _selectedCategory.value;

  set selectedCategory(int value) => _selectedCategory.value = value;

  void setSelected(int index) {
    if (selectedCategory == index) {
      selectedCategory = -1;
      return;
    }
    selectedCategory = index;
  }

  final Rx<FocusNode> _focusNode = Rx<FocusNode>(FocusNode());
  final TextEditingController searchController = TextEditingController();

  FocusNode get focusNode => _focusNode.value;
  final _searchText = ''.obs;

  String get searchText => _searchText.value;

  set searchText(String value) => _searchText.value = value;

  final _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  final _selectAll = false.obs;

  bool get selectAll => _selectAll.value;

  set selectAll(bool value) => _selectAll.value = value;
  final Rx<String?> _state = Rx<String?>(null);
  final Rx<String?> _lga = Rx<String?>(null);

  String? get state => _state.value;

  set state(String? value) => _state.value = value;

  String? get lga => _lga.value;

  set lga(String? value) => _lga.value = value;

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

  void resetFields() {
    state = null;
    lga = null;
    listOfLgas.clear();
  }

  final categories = <Category>[].obs;
  final categoryList = <String>[].obs;

  void reorder(int oldIndex, int newIndex) {
    final item = categoryList.removeAt(oldIndex);
    categoryList.insert(newIndex, item);
  }

  void getCategories() {
    final homePageController = Get.find<HomePageController>();
    categories.assignAll(homePageController.categories);
    categoryList.assignAll(homePageController.categoryList);
  }

  final searchList = <SearchModel>[].obs;

  Future<void> search() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (selectedCategory == -1) {
      CustomSnackBar.showGet(
          title: 'Error!',
          content: 'You need to select a category',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      return;
    }
    final categoryId = categories
        .firstWhere((e) => e.title == categoryList[selectedCategory])
        .id;
    Map body = {
      'category_id': '$categoryId',
      'product': searchText,
    };
    if (position != null) {
      body.addAll({
        'lat': position!.latitude,
        'lng': position!.longitude,
      });
    }
    try {
      isProcessing = true;
      final model = await APIService().search(body);
      searchList.assignAll(model);
    } catch (e) {
      debugPrint(e.toString());
      CustomSnackBar.showGet(
          title: 'Error!',
          content: 'An error occurred. Please try again',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
    } finally {
      isProcessing = false;
    }
  }

  Future<void> sendToStores() async {}
  RxBool get isSearch =>
      (focusNode.hasFocus || searchList.isEmpty) ? RxBool(true) : RxBool(false);

  @override
  void onReady() {
    super.onReady();
    focusNode.requestFocus();
    fetchStates();
    getCategories();
    if (position == null) {
      getCurrentLocation();
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
