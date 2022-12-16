import 'package:beere_mobile/Models/product_of_the_week.dart';
import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/models/category_model.dart';
import 'package:beere_mobile/modules/home_page_module/view/user_search_view.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'promotion_controller.dart';

class HomePageController extends GetxController {
  final _firstIndex = 0.obs;
  final _secondIndex = 0.obs;

  int get firstIndex => _firstIndex.value;

  set firstIndex(int value) => _firstIndex.value = value;

  int get secondIndex => _secondIndex.value;

  set secondIndex(int value) => _secondIndex.value = value;

  void reorder(int oldIndex, int newIndex) {
    final item = categoryList.removeAt(oldIndex);
    categoryList.insert(newIndex, item);
  }

  List<Product> firstProduct = [
    Product(
        id: 1,
        title: "Product Of The\nWeek",
        subtitle: "Classic Soft Drinks",
        text:
            "One of the important product we have\n in product of the week, One of the important product we have\n in product of the week",
        imageUrl: Assets.cokeImage),
    Product(
      id: 1,
      title: "Product Of The\nWeek",
      subtitle: "Classic Soft Drinks",
      text:
          "One of the important product we have\n in product of the week, One of the important product we have\n in product of the week",
      imageUrl: Assets.cokeImage,
    ),
    Product(
      id: 1,
      title: "Product Of The\nWeek",
      subtitle: "Classic Soft Drinks",
      text:
          "One of the important product we have\n in product of the week, One of the important product we have\n in product of the week",
      imageUrl: Assets.cokeImage,
    ),
    Product(
      id: 1,
      title: "Product Of The\nWeek",
      subtitle: "Classic Soft Drinks",
      text:
          "One of the important product we have\n in product of the week, One of the important product we have\n in product of the week",
      imageUrl: Assets.cokeImage,
    ),
  ];

  final _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  final categories = <Category>[].obs;
  final categoryList = <String>[].obs;

  Future<void> fetchCategories() async {
    try {
      final list = await APIService().getCategories();
      categories.assignAll(list);
      categoryList.assignAll(list.map((e) => e.title).toList());
      Get.find<PromotionController>()
        ..categories.assignAll(list)
        ..categoryList.assignAll(categoryList);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void search() {
    Get.toNamed(UserSearchView.route);
  }

  @override
  void onReady() {
    super.onReady();
    fetchCategories();
  }
}
