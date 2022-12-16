import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/models/category_model.dart';
import 'package:beere_mobile/modules/home_page_module/controller/home_page_controller.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class UserSearchViewController extends GetxController {
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

  final FocusNode _focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  FocusNode get focusNode => _focusNode;
  final _searchText = ''.obs;

  String get searchText => _searchText.value;

  set searchText(String value) => _searchText.value = value;

  final _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  final _selectAll = false.obs;

  bool get selectAll => _selectAll.value;

  set selectAll(bool value) => _selectAll.value = value;

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

  Future<void> search() async {
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
      debugPrint(body.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
    _focusNode.requestFocus();
    getCategories();
    if (position == null) {
      getCurrentLocation();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
