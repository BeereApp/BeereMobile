import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/models/category_model.dart';
import 'package:beere_mobile/models/promotion_model.dart';
import 'package:beere_mobile/modules/home_page_module/view/promotion_detail_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/promotion_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromotionController extends GetxController {
  final _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  final promotions = <PromotionModel>[].obs;
  final promotionsWithDiscount = <PromotionModel>[].obs;

  PromotionModel? selectedPromotion;

  Future<void> fetchPromotions() async {
    try {
      isProcessing = true;
      final model = await APIService().getPromotions();
      promotions.assignAll(model);
      promotionsWithDiscount.assignAll(promotions.where((e) => e.discount > 0));
      promotionsWithDiscount.sort((a, b) => b.discount.compareTo(a.discount));
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

  Future<void> clickPromotion(PromotionModel model) async {
    final params = {
      'vendor_id': model.vendorId.toString(),
      'promotion_id': model.id.toString(),
    };
    try {
      APIService().clickPromotion(params);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final categories = <Category>[].obs;
  final categoryList = <String>[].obs;

  Future<void> fetchCategories() async {
    try {
      final list = await APIService().getCategories();
      categories.assignAll(list);
      categoryList.assignAll(list.map((e) => e.title).toList());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void gotoPromotionsPage() {
    Get.toNamed(PromotionView.route);
  }

  void gotoDetailsView(PromotionModel model) async {
    selectedPromotion = model;
    Get.toNamed(PromotionDetailView.route);
    clickPromotion(model);
  }

  @override
  void onReady() {
    super.onReady();
    fetchPromotions();
    // fetchCategories();
  }
}
