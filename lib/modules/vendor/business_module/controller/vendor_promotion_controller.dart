import 'dart:io';

import 'package:beere_mobile/api/api_service.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/models/category_model.dart';
import 'package:beere_mobile/models/promotion_model.dart';
import 'package:beere_mobile/modules/vendor/business_module/view/vendor_promotion_details_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/extensions.dart';
import 'package:beere_mobile/widgets/select_image_dialog.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class VendorPromotionController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _productName = ''.obs;
  final _productType = ''.obs;
  final _category = Rx<String?>(null);
  final _location = ''.obs;
  final _price = ''.obs;
  final _discount = ''.obs;
  final _description = ''.obs;
  final _image = Rx<File?>(null);

  String get productName => _productName.value;

  set productName(String value) => _productName.value = value;

  String get productType => _productType.value;

  set productType(String value) => _productType.value = value;

  String? get category => _category.value;

  set category(String? value) => _category.value = value;

  String get location => _location.value;

  set location(String value) => _location.value = value;

  String get price => _price.value;

  set price(String value) => _price.value = value;

  String get discount => _discount.value;

  set discount(String value) => _discount.value = value;

  String get description => _description.value;

  set description(String value) => _description.value = value;

  File? get image => _image.value;

  set image(File? value) => _image.value = value;

  final Rx<DateTime?> _startDate = Rx<DateTime?>(null);
  final Rx<DateTime?> _endDate = Rx<DateTime?>(null);

  set startDate(DateTime? value) => _startDate.value = value;

  DateTime? get startDate => _startDate.value;

  set endDate(DateTime? value) => _endDate.value = value;

  DateTime? get endDate => _endDate.value;

  final _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  final promotions = <PromotionModel>[].obs;

  PromotionModel? selectedPromotion;

  Future<void> fetchPromotions() async {
    try {
      isProcessing = true;
      final model = await APIService().getVendorPromotions();
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

  void gotoDetailsView(PromotionModel model) async {
    selectedPromotion = model;
    Get.toNamed(VendorPromotionDetailsView.route);
  }

  void setStartDate() async {
    DateTime now = DateTime.now();
    await showDatePicker(
            context: Get.context!,
            initialDate: startDate ?? now,
            firstDate: now,
            lastDate: DateTime(now.year + 1, 12))
        .then((pickedDate) async {
      if (pickedDate == null) {
        return;
      }
      startDate = pickedDate;
      await showTimePicker(context: Get.context!, initialTime: TimeOfDay.now())
          .then((pickedTime) {
        if (pickedTime == null) {
          startDate = null;
          return;
        }
        startDate = DateTime(startDate!.year, startDate!.month, startDate!.day,
            pickedTime.hour, pickedTime.minute);
      });
    });
    if (startDate != null && !startDate!.isAfter(now)) {
      CustomSnackBar.showGet(
          backgroundColor: kPrimaryRed,
          title: 'Error!',
          content: 'Start time has to be after this moment.',
          textColor: kWhite);
      startDate = null;
    }
  }

  void setEndDate() async {
    DateTime now = DateTime.now();
    await showDatePicker(
            context: Get.context!,
            initialDate: endDate ?? now,
            firstDate: now,
            lastDate: DateTime(now.year + 1, 12))
        .then((pickedDate) async {
      if (pickedDate == null) {
        return;
      }
      endDate = pickedDate;
      await showTimePicker(context: Get.context!, initialTime: TimeOfDay.now())
          .then((pickedTime) {
        if (pickedTime == null) {
          endDate = null;
          return;
        }
        endDate = DateTime(endDate!.year, endDate!.month, endDate!.day,
            pickedTime.hour, pickedTime.minute);
      });
    });

    if (endDate != null && !endDate!.isAfter(now)) {
      CustomSnackBar.showGet(
          backgroundColor: kPrimaryRed,
          title: 'Error!',
          content: 'End time has to be after this moment.',
          textColor: kWhite);
      endDate = null;
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

  Future<void> addPromotion() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!validate()) return;
    final categoryId =
        categories.firstWhere((e) => e.title == category).id.toString();
    final body = {
      'product_name': productName,
      'product_type': productType,
      'location': location,
      'discount_price': discount.isEmpty ? '0' : discount,
      'price_range': price,
      'description': description,
      'category_id': categoryId,
      'promotion_starts':
          startDate!.toUtc().toIso8601String().replaceAll('Z', ''),
      'promotion_ends': endDate!.toUtc().toIso8601String().replaceAll('Z', ''),
    };
    final files = <http.MultipartFile>[];
    files.add(await http.MultipartFile.fromPath('product_image', image!.path,
        filename: image!.fileName,
        contentType: MediaType.parse(image!.contentType)));
    try {
      isProcessing = true;
      final response = await APIService().addPromotion(body, files);
      if (response) {
        fetchPromotions();
        image = category = startDate = endDate = null;
        Get.back();
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

  @override
  void onReady() {
    super.onReady();
    fetchPromotions();
    fetchCategories();
  }

  void selectImage(BuildContext context) {
    showDialog(context: context, builder: (_) => const SelectImageDialog())
        .then((value) async {
      if (value == 'gallery') {
        File? image = await pickImage(source: ImageSource.gallery);
        if (image != null) {
          this.image = image;
        }
      }
      if (value == 'camera') {
        File? image = await pickImage(source: ImageSource.camera);
        if (image != null) {
          this.image = image;
        }
      }
    });
  }

  bool validate() {
    if (!formKey.currentState!.validate()) return false;
    if (image == null) {
      CustomSnackBar.showGet(
          title: 'Info!',
          content: 'You need to upload an image',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      return false;
    }
    if (category == null) {
      CustomSnackBar.showGet(
          title: 'Info!',
          content: 'You need to Select a category',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      return false;
    }
    if (startDate == null || endDate == null) {
      CustomSnackBar.showGet(
          title: 'Info!',
          content: 'You need to set both start and end date',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      return false;
    }
    return true;
  }
}
