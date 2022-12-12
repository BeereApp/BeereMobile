import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/models/promotion_model.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VendorStatisticsController extends GetxController {
  final _index = 0.obs;

  int get index => _index.value;

  set index(value) => _index.value = value;

  final _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  final promotions = <PromotionModel>[].obs;

  Future<void> fetchPromotionsWithClicks() async {
    try {
      isProcessing = true;
      final model = await APIService().getPromotionClicks();
      promotions.assignAll(model);
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

  double getChartHeight(int length) {
    if (length == 0) {
      return (36 + (30 * 1)).h;
    } else if (length < 6) {
      return (36 + (30 * length)).h;
    } else {
      return (36 + (30 * 6)).h;
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchPromotionsWithClicks();
  }
}
