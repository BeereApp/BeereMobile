import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorSearchViewController extends GetxController {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();
  FocusNode get focusNode => _focusNode;
  final _searchText = ''.obs;
  String get searchText => _searchText.value;

  set searchText(String value) => _searchText.value = value;

  @override
  void onReady() {
    super.onReady();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
