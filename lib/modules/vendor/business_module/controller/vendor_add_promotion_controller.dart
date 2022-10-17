import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorAddPromotionController extends GetxController {
  final Rx<DateTime?> _startDate = Rx<DateTime?>(null);
  final Rx<DateTime?> _endDate = Rx<DateTime?>(null);

  set startDate(DateTime? value) => _startDate.value = value;

  DateTime? get startDate => _startDate.value;

  set endDate(DateTime? value) => _endDate.value = value;

  DateTime? get endDate => _endDate.value;

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
          content: 'Start time has to be after this moment.',
          textColor: kWhite);
      endDate = null;
    }
  }
}
