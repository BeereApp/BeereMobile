import 'package:beere_mobile/models/promotion_model.dart';
import 'package:beere_mobile/modules/vendor/business_module/controller/vendor_promotion_controller.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/utils/extensions.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VendorPromotionCard extends StatelessWidget {
  const VendorPromotionCard({super.key, required this.model});

  final PromotionModel model;

  @override
  Widget build(BuildContext context) {
    final discountPrice = model.price * (model.discount / 100);
    final offer = model.price - discountPrice;
    return Card(
      elevation: 2,
      shadowColor: kPrimaryBlue,
      color: kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding:
            EdgeInsets.only(left: 8.w, right: 16.w, top: 12.h, bottom: 12.0.h),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: model.productImage,
                  height: 50.h,
                  width: 50.w,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) => Icon(
                    Icons.question_mark,
                    size: 45.r,
                    color: kBlack,
                  ),
                  placeholder: (context, url) => Icon(
                    Icons.question_mark,
                    size: 45.r,
                    color: kBlack,
                  ),
                ),
              ),
            ),
            Gap(8.w),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    model.productName,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                  Gap(2.h),
                  MyText(
                    model.productType,
                    fontSize: 10.sp,
                  ),
                  Gap(6.h),
                  RichText(
                    text: TextSpan(
                      text: offer.formatToAmount,
                      style: TextStyle(
                          color: kTextGray,
                          fontSize: 18.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none),
                      children: [
                        const TextSpan(
                            text: ' ',
                            style: TextStyle(decoration: TextDecoration.none)),
                        TextSpan(
                          text: model.price.formatToAmount,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              color: kPrimaryRed,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(8.w),
            Expanded(
              flex: 4,
              child: PrimaryButton(
                onPressed: () => Get.find<VendorPromotionController>()
                    .gotoDetailsView(model),
                text: 'View Details',
                hasOuterPadding: false,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.h),
                borderRadius: 6.r,
                textStyle: kStylePoppins.copyWith(
                    color: kWhite,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DurationWidget extends StatelessWidget {
  const DurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<VendorPromotionController>(
      builder: (controller) => Card(
        color: kWhite,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                'Promotion Starts',
                fontSize: 12.sp,
                color: kPrimaryBlue,
                fontStyle: FontStyle.poppins,
              ),
              Gap(8.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: OnTapFade(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.setStartDate();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            'Month',
                            fontSize: 12.sp,
                            color: kBlack,
                            fontStyle: FontStyle.poppins,
                          ),
                          Gap(12.h),
                          Row(
                            children: [
                              MyText(
                                controller.startDate == null
                                    ? '_ _ _'
                                    : DateFormat('MMM')
                                        .format(controller.startDate!),
                                fontSize: 14.sp,
                                color: const Color(0xFFB5B5B5),
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                Assets.downArrowIcon,
                                width: 16.w,
                                height: 8.h,
                                color: const Color(0xFFB5B5B5),
                              ),
                            ],
                          ),
                          Gap(2.h),
                          Divider(
                            color: const Color(0xFFB5B5B5),
                            height: 1.h,
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(24.w),
                  Expanded(
                    flex: 2,
                    child: OnTapFade(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.setStartDate();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            'Day',
                            fontSize: 12.sp,
                            color: kBlack,
                            fontStyle: FontStyle.poppins,
                          ),
                          Gap(12.h),
                          Row(
                            children: [
                              MyText(
                                controller.startDate == null
                                    ? '_ _'
                                    : DateFormat('dd')
                                        .format(controller.startDate!),
                                fontSize: 14.sp,
                                color: const Color(0xFFB5B5B5),
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                Assets.downArrowIcon,
                                width: 16.w,
                                height: 8.h,
                                color: const Color(0xFFB5B5B5),
                              ),
                            ],
                          ),
                          Gap(2.h),
                          Divider(
                            color: const Color(0xFFB5B5B5),
                            height: 1.h,
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(24.w),
                  Expanded(
                    flex: 3,
                    child: OnTapFade(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.setStartDate();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            'Time',
                            fontSize: 12.sp,
                            color: kBlack,
                            fontStyle: FontStyle.poppins,
                          ),
                          Gap(12.h),
                          Row(
                            children: [
                              MyText(
                                controller.startDate == null
                                    ? '_ _ : _ _'
                                    : DateFormat('hh:mm')
                                        .format(controller.startDate!),
                                fontSize: 14.sp,
                                color: const Color(0xFFB5B5B5),
                                fontWeight: FontWeight.w600,
                              ),
                              Gap(16.w),
                              MyText(
                                controller.startDate == null
                                    ? '_ _'
                                    : DateFormat.jm()
                                        .format(controller.startDate!)
                                        .split(' ')[1],
                                fontSize: 14.sp,
                                color: const Color(0xFFB5B5B5),
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                Assets.downArrowIcon,
                                width: 16.w,
                                height: 8.h,
                                color: const Color(0xFFB5B5B5),
                              ),
                            ],
                          ),
                          Gap(2.h),
                          Divider(
                            color: const Color(0xFFB5B5B5),
                            height: 1.h,
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20.h),
              MyText(
                'Promotion Ends',
                fontSize: 12.sp,
                color: kPrimaryBlue,
                fontStyle: FontStyle.poppins,
              ),
              Gap(8.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: OnTapFade(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.setEndDate();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            'Month',
                            fontSize: 12.sp,
                            color: kBlack,
                            fontStyle: FontStyle.poppins,
                          ),
                          Gap(12.h),
                          Row(
                            children: [
                              MyText(
                                controller.endDate == null
                                    ? '_ _ _'
                                    : DateFormat('MMM')
                                        .format(controller.endDate!),
                                fontSize: 14.sp,
                                color: const Color(0xFFB5B5B5),
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                Assets.downArrowIcon,
                                width: 16.w,
                                height: 8.h,
                                color: const Color(0xFFB5B5B5),
                              ),
                            ],
                          ),
                          Gap(2.h),
                          Divider(
                            color: const Color(0xFFB5B5B5),
                            height: 1.h,
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(24.w),
                  Expanded(
                    flex: 2,
                    child: OnTapFade(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.setEndDate();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            'Day',
                            fontSize: 12.sp,
                            color: kBlack,
                            fontStyle: FontStyle.poppins,
                          ),
                          Gap(12.h),
                          Row(
                            children: [
                              MyText(
                                controller.endDate == null
                                    ? '_ _'
                                    : DateFormat('dd')
                                        .format(controller.endDate!),
                                fontSize: 14.sp,
                                color: const Color(0xFFB5B5B5),
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                Assets.downArrowIcon,
                                width: 16.w,
                                height: 8.h,
                                color: const Color(0xFFB5B5B5),
                              ),
                            ],
                          ),
                          Gap(2.h),
                          Divider(
                            color: const Color(0xFFB5B5B5),
                            height: 1.h,
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(24.w),
                  Expanded(
                    flex: 3,
                    child: OnTapFade(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.setEndDate();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            'Time',
                            fontSize: 12.sp,
                            color: kBlack,
                            fontStyle: FontStyle.poppins,
                          ),
                          Gap(12.h),
                          Row(
                            children: [
                              MyText(
                                controller.endDate == null
                                    ? '_ _ : _ _'
                                    : DateFormat('hh:mm')
                                        .format(controller.endDate!),
                                fontSize: 14.sp,
                                color: const Color(0xFFB5B5B5),
                                fontWeight: FontWeight.w600,
                              ),
                              Gap(16.w),
                              MyText(
                                controller.endDate == null
                                    ? '_ _'
                                    : DateFormat.jm()
                                        .format(controller.endDate!)
                                        .split(' ')[1],
                                fontSize: 14.sp,
                                color: const Color(0xFFB5B5B5),
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                Assets.downArrowIcon,
                                width: 16.w,
                                height: 8.h,
                                color: const Color(0xFFB5B5B5),
                              ),
                            ],
                          ),
                          Gap(2.h),
                          Divider(
                            color: const Color(0xFFB5B5B5),
                            height: 1.h,
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
