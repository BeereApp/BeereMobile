import 'package:beere_mobile/modules/vendor/onboarding_module/controller/vendor_register_controller.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<VendorRegisterController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 16.r,
                  width: 16.r,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentStep > 1 ? kPrimaryBlue : null,
                      border: Border.all(color: kPrimaryBlue)),
                  child: MyText(
                    '1',
                    color: controller.currentStep > 1 ? kWhite : kPrimaryBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp,
                    fontStyle: FontStyle.poppins,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: kPrimaryBlue,
                    thickness: 1,
                    height: 1,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 16.r,
                  width: 16.r,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentStep > 2 ? kPrimaryBlue : null,
                      border: Border.all(
                          color: controller.currentStep < 2
                              ? kTextGray
                              : kPrimaryBlue)),
                  child: MyText(
                    '2',
                    color: controller.currentStep < 2
                        ? kTextGray
                        : controller.currentStep > 2
                            ? kWhite
                            : kPrimaryBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp,
                    fontStyle: FontStyle.poppins,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color:
                        controller.currentStep < 2 ? kTextGray : kPrimaryBlue,
                    thickness: 1,
                    height: 1,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 16.r,
                  width: 16.r,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentStep > 3 ? kPrimaryBlue : null,
                      border: Border.all(
                          color: controller.currentStep < 3
                              ? kTextGray
                              : kPrimaryBlue)),
                  child: MyText(
                    '3',
                    color: controller.currentStep < 3
                        ? kTextGray
                        : controller.currentStep > 3
                            ? kWhite
                            : kPrimaryBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp,
                    fontStyle: FontStyle.poppins,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color:
                        controller.currentStep < 3 ? kTextGray : kPrimaryBlue,
                    thickness: 1,
                    height: 1,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 16.r,
                  width: 16.r,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentStep > 4 ? kPrimaryBlue : null,
                      border: Border.all(
                          color: controller.currentStep < 4
                              ? kTextGray
                              : kPrimaryBlue)),
                  child: MyText(
                    '4',
                    color: controller.currentStep < 4
                        ? kTextGray
                        : controller.currentStep > 4
                            ? kWhite
                            : kPrimaryBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp,
                    fontStyle: FontStyle.poppins,
                  ),
                ),
              ],
            ),
          ),
          Gap(6.h),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: MyText(
                  'Seller account',
                  color: kBlack.withOpacity(0.58),
                  textAlign: TextAlign.center,
                  fontStyle: FontStyle.poppins,
                  fontSize: 12.sp,
                ),
              ),
              Gap(12.w),
              Expanded(
                child: MyText(
                  'Business information',
                  color: kBlack.withOpacity(0.58),
                  fontStyle: FontStyle.poppins,
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(12.w),
              Expanded(
                child: MyText(
                  'Bank account',
                  color: kBlack.withOpacity(0.58),
                  fontStyle: FontStyle.poppins,
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(12.w),
              Expanded(
                child: MyText(
                  'Summary',
                  color: kBlack.withOpacity(0.58),
                  fontStyle: FontStyle.poppins,
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  const CategoryBox(
    this.text, {
    super.key,
    this.textColor,
    this.fontSize,
    this.rightMargin,
    this.bottomMargin,
  });

  final String text;
  final Color? textColor;
  final double? fontSize;
  final double? rightMargin;
  final double? bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: rightMargin ?? 16.w, bottom: bottomMargin ?? 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: const Color(0xFFF2F6FC),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: MyText(text,
          fontSize: fontSize ?? 16.sp,
          color: textColor,
          fontWeight: FontWeight.w500),
    );
  }
}
