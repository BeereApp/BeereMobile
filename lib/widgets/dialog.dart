import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MyDialog {
  static void showInfo(String info,
      {VoidCallback? onYesTap, VoidCallback? onNoTap}) {
    Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText(
              info,
              fontSize: 16.sp,
              textAlign: TextAlign.center,
            ),
            Gap(50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: onYesTap != null && onNoTap != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  if (onYesTap != null)
                    CardButton(
                      label: 'Yes',
                      onTap: onYesTap,
                      color: kPrimaryBlue,
                      borderRadius: 6.r,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      textColor: kWhite,
                    ),
                  if (onNoTap != null)
                    CardButton(
                      label: 'Cancel',
                      color: kWhite,
                      onTap: onNoTap,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      textColor: kPrimaryBlue,
                      borderRadius: 6.r,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
