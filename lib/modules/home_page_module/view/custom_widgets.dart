import 'package:beere_mobile/modules/home_page_module/controller/user_search_controller.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/drop_down_widget.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.elevation,
    required this.promoText,
    required this.productText,
    required this.productDescription,
    this.oldPrice,
    this.newPrice,
    this.buttonColor,
    this.onTap,
    required this.image,
    this.margin,
  });

  final double? elevation;
  final String promoText;
  final String productText;
  final String productDescription;
  final String? oldPrice;
  final String? newPrice;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final String image;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      elevation: elevation ?? 4,
      color: kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      shadowColor: kPrimaryBlue,
      child: Container(
        height: 185.h,
        width: 320.w,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    promoText,
                    fontWeight: FontWeight.w900,
                    color: kBlack,
                    fontSize: 19.5.sp,
                    letterSpacing: 0.045.sp,
                    height: (20.5 / 19.5).sp,
                    fontStyle: FontStyle.poppins,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(8.h),
                  MyText(
                    productText,
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                    color: kBlack,
                    fontStyle: FontStyle.poppins,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(2.h),
                  MyText(
                    productDescription,
                    fontSize: 8.sp,
                    fontStyle: FontStyle.poppins,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(4.h),
                  RichText(
                    text: TextSpan(
                      text: oldPrice != null ? '$oldPrice' : '',
                      style: TextStyle(
                          color: kScrollGrey,
                          fontSize: 14.sp,
                          decoration: TextDecoration.lineThrough),
                      children: [
                        const TextSpan(
                            text: ' ',
                            style: TextStyle(decoration: TextDecoration.none)),
                        TextSpan(
                          text: newPrice != null ? '$newPrice' : '',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: kBlack,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                  Gap(4.h),
                  Row(
                    children: [
                      CardButton(
                        label: 'ORDER NOW',
                        fontSize: 9.sp,
                        onTap: onTap,
                        color: buttonColor ?? kPrimaryGreen,
                        textColor: kWhite,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: UnconstrainedBox(
                child: SizedBox(
                  height: 100.r,
                  width: 100.r,
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: image,
                    errorWidget: (context, url, error) => Icon(
                      Icons.question_mark,
                      size: 70.r,
                      color: kBlack,
                    ),
                    placeholder: (context, url) => Icon(
                      Icons.question_mark,
                      size: 70.r,
                      color: kBlack,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListIndicator extends StatelessWidget {
  const ListIndicator({super.key, required this.position, required this.count});

  final int position;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DotsIndicator(
            dotsCount: count,
            position: position.toDouble(),
            decorator: DotsDecorator(
                color: Colors.transparent,
                activeColor: kPrimaryBlue,
                shape: const CircleBorder(
                    side: BorderSide(color: kPrimaryBlue, width: 0.5)),
                activeSize: Size(15.w, 8.h),
                spacing: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r))),
          ),
        ),
      ),
    );
  }
}

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<UserSearchController>(
      builder: (controller) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(16.r),
            ),
            //padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
                  decoration: BoxDecoration(
                      color: kPrimaryBlue,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        'Filter',
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        fontStyle: FontStyle.poppins,
                        color: kWhite,
                      ),
                      OnTapFade(
                        onTap: () {
                          Get.back();
                          controller.resetFields();
                        },
                        child: Icon(
                          Icons.close,
                          color: kWhite,
                          size: 32.r,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        'Search by Location',
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp,
                      ),
                      Gap(16.h),
                      DropDownMenuWidget(
                        value: controller.state,
                        hint: 'Select State',
                        itemList: controller.listOfStates,
                        isDense: true,
                        fillColor: kBorderColor,
                        hasLabel: false,
                        onChanged: (value) {
                          //To ensure lga dropdown is reset
                          if (controller.state != value) {
                            controller.lga = null;
                          }
                          controller.state = value;
                          controller.populateLga(value);
                        },
                      ),
                      Gap(20.h),
                      DropDownMenuWidget(
                        fillColor: kBorderColor,
                        hasLabel: false,
                        value: controller.lga,
                        hint: 'Select LGA',
                        itemList: controller.listOfLgas,
                        isDense: true,
                        onChanged: (value) {
                          controller.lga = value;
                        },
                      ),
                      Gap(24.h),
                      OnTapFade(
                        onTap: () {
                          Get.back();
                        },
                        child: MyText(
                          'Search using current location',
                          fontSize: 16.sp,
                          color: kPrimaryBlue,
                        ),
                      ),
                      Gap(30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CardButton(
                                label: 'Complete',
                                onTap: () {
                                  Get.back();
                                },
                                color: kPrimaryBlue,
                                borderRadius: 12.r,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 16.h),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textColor: kWhite,
                              ),
                            ),
                            Gap(24.w),
                            Expanded(
                              child: CardButton(
                                label: 'Reset',
                                onTap: () {
                                  controller.resetFields();
                                },
                                color: kBorderColor,
                                borderRadius: 12.r,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 16.h),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textColor: kPrimaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
