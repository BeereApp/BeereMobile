import 'package:beere_mobile/modules/vendor/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/modules/vendor/settings_module/controller/vendor_statistics_controller.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/switch_button.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VendorStatisticsView extends StatelessWidget {
  static const String route = '/vendor_statistics_view';

  const VendorStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<VendorStatisticsController>(
      init: VendorStatisticsController(),
      builder: (controller) => Scaffold(
        appBar:
            customAppbar(context, titleText: 'Statistics', centerTitle: false),
        extendBodyBehindAppBar: true,
        body: Background(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            children: [
              SwitchThreeButton(
                text1: 'Top search',
                text2: 'Appearance',
                text3: 'Clicks',
                onOnePressed: () => controller.index = 0,
                onTwoPressed: () => controller.index = 1,
                onThreePressed: () => controller.index = 2,
              ),
              Gap(12.h),
              Expanded(
                  child: controller.index == 0
                      ? _topSearch()
                      : controller.index == 1
                          ? _appearance()
                          : _clicks()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topSearch() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PopupMenuButton<int>(
                onSelected: (value) {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  children: [
                    MyText(
                      'This Month',
                      color: kPrimaryBlue,
                      fontSize: 12.sp,
                    ),
                    Gap(4.w),
                    SvgPicture.asset(
                      Assets.downArrowIcon,
                      color: kPrimaryBlue,
                      width: 13.w,
                      height: 7.h,
                    ),
                  ],
                ),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(value: 0, child: MyText('This month')),
                  ];
                }),
          ],
        ),
        Gap(8.h),
        const VendorCard2(
          category: 'Stationary',
          value: '1200',
          productName: 'Whiteboard',
          color: kPrimaryGreen,
          elevation: 1,
        ),
      ],
    );
  }

  Widget _appearance() {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 110.h,
          color: const Color(0xFFF0F1F2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                '60',
                fontSize: 24.sp,
                fontStyle: FontStyle.poppins,
                fontWeight: FontWeight.w600,
              ),
              MyText(
                'Search Appearances',
                fontSize: 10.sp,
                fontStyle: FontStyle.poppins,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        Gap(20.h),
        Container(
          width: double.maxFinite,
          color: kWhite,
          padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 30.h),
          child: Column(
            children: [
              Icon(
                Icons.location_on,
                color: kPrimaryBlue,
                size: 40.r,
              ),
              Gap(8.h),
              MyText('You got more search appearances from this location(s)',
                  fontSize: 12.sp),
              Gap(24.h),
              _location(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _clicks() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: MyText(
                'Father\'s day promotion. 28th, June.',
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Gap(20.w),
            Row(
              children: [
                MyText(
                  'See post',
                  color: kPrimaryBlue,
                  fontSize: 12.sp,
                ),
                Gap(8.w),
                RotatedBox(
                  quarterTurns: 135,
                  child: SvgPicture.asset(
                    Assets.downArrowIcon,
                    color: kPrimaryBlue,
                    width: 13.w,
                    height: 7.h,
                  ),
                ),
              ],
            ),
          ],
        ),
        Gap(4.h),
        Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          color: const Color(0xFFFEFAFA),
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                child: Column(
                  children: [
                    MyText(
                      '60',
                      fontSize: 24.sp,
                      fontStyle: FontStyle.poppins,
                      color: const Color(0xFF474747),
                    ),
                    MyText(
                      'Search Appearances',
                      fontSize: 10.sp,
                      fontStyle: FontStyle.poppins,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF474747),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CardButton(
                    label: 'Active',
                    color: kPrimaryGreen,
                    textColor: kWhite,
                    alignToCenter: false,
                    borderRadius: 16.r,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _location() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              'label',
              fontSize: 14.sp,
              color: kBlack.withOpacity(0.8),
            ),
            MyText(
              'label',
              fontSize: 14.sp,
              color: kBlack.withOpacity(0.8),
            ),
          ],
        ),
        Gap(4.h),
        Divider(
          color: kLightGray,
          height: 0.5.h,
          thickness: 0.5,
        ),
      ],
    );
  }
}
