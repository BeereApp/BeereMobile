import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/drop_down_widget.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/pie_chart.dart';
import 'package:beere_mobile/widgets/progress_bar.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VendorCard1 extends StatelessWidget {
  const VendorCard1({
    super.key,
    required this.percent,
    required this.number,
    required this.text,
    required this.iconColor,
    required this.icon,
    this.isPositive = true,
  });
  final String percent;
  final String number;
  final String text;
  final Color iconColor;
  final String icon;
  final bool isPositive;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MyText(
                      '$percent%',
                      fontSize: 12.sp,
                      color: isPositive ? kPrimaryGreen : kPrimaryRed,
                      fontStyle: FontStyle.poppins,
                    ),
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      color: isPositive ? kPrimaryGreen : kPrimaryRed,
                      size: 13.sp,
                    ),
                  ],
                ),
                Gap(8.h),
                MyText(
                  number,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.poppins,
                ),
                Gap(4.h),
                MyText(
                  text,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            CircleAvatar(
              radius: 28.r,
              backgroundColor: iconColor.withOpacity(0.2),
              child: SvgPicture.asset(
                icon,
                width: 24.r,
                height: 24.r,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VendorCard2 extends StatelessWidget {
  const VendorCard2({
    super.key,
    required this.category,
    required this.value,
    required this.productName,
    required this.color,
    this.elevation,
  });
  final String category;
  final String value;
  final String productName;
  final Color color;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 3,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      color: color.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 12.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyText(
                    'Category',
                    color: kBlack,
                    fontSize: 7.sp,
                    fontStyle: FontStyle.poppins,
                  ),
                  MyText(
                    category,
                    color: color,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.poppins,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    value,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.poppins,
                    color: color,
                  ),
                  MyText(
                    productName,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.poppins,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VendorCard3 extends StatelessWidget {
  const VendorCard3(
      {super.key,
      required this.number,
      required this.text,
      required this.color,
      required this.icon,
      this.isPositive = true,
      required this.percent});
  final String number;
  final String text;
  final String percent;
  final Color color;
  final String icon;
  final bool isPositive;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 10.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundColor: color.withOpacity(0.2),
                  child: SvgPicture.asset(
                    icon,
                    width: 24.r,
                    height: 24.r,
                    color: color,
                  ),
                ),
                Row(
                  children: [
                    MyText(
                      '$percent%',
                      fontSize: 12.sp,
                      color: isPositive ? kPrimaryGreen : kPrimaryRed,
                      fontStyle: FontStyle.poppins,
                    ),
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      color: isPositive ? kPrimaryGreen : kPrimaryRed,
                      size: 13.sp,
                    ),
                  ],
                ),
              ],
            ),
            Gap(6.h),
            MyText(
              number,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.poppins,
            ),
            MyText(
              text,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.clockIcon,
            height: 22.r,
            width: 22.r,
          ),
          Gap(20.w),
          MyText(
            'Coca cola',
            fontSize: 14.sp,
            fontStyle: FontStyle.poppins,
            letterSpacing: -0.02.sp,
          ),
          const Spacer(),
          SvgPicture.asset(
            Assets.arrowLinkIcon,
            height: 22.r,
            width: 22.r,
          ),
        ],
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MyText(
                  'Ebano, Lekki',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.poppins,
                ),
                Gap(4.w),
                CircleAvatar(
                  radius: 3.r,
                  backgroundColor: kPrimaryGreen,
                ),
              ],
            ),
            Row(
              children: [
                MyText(
                  'This Month',
                  fontSize: 14.sp,
                  color: kPrimaryBlue,
                ),
                Gap(8.w),
                SvgPicture.asset(
                  Assets.downArrowIcon,
                  color: kPrimaryBlue,
                  width: 10.r,
                  height: 10.r,
                ),
              ],
            )
          ],
        ),
        Gap(10.h),
        const VendorCard1(
          percent: '10',
          number: '30',
          text: 'Coca cola search data',
          iconColor: Color(0xFF574FF9),
          icon: Assets.searchIcon2,
        ),
        Gap(10.h),
        MyText(
          'Age Group',
          fontStyle: FontStyle.poppins,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        Gap(12.h),
        Row(
          children: [
            PieCharts(),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _label('Below 18', Colors.blue),
                Gap(10.h),
                _label('18 - 34', Colors.blue),
                Gap(10.h),
                _label('34 - 50', Colors.blue),
                Gap(10.h),
                _label('51 - 69', Colors.blue),
                Gap(10.h),
                _label('70 - 87', Colors.blue),
                Gap(10.h),
                _label('Above 88', Colors.blue),
                Gap(10.h),
              ],
            ),
          ],
        ),
        Gap(30.h),
        MyText(
          'Gender',
          fontStyle: FontStyle.poppins,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        Gap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              'Male(%)',
              fontSize: 14.sp,
              color: kTextGray.withOpacity(0.7),
            ),
            MyText(
              'Female(%)',
              fontSize: 14.sp,
              color: kTextGray.withOpacity(0.7),
            ),
          ],
        ),
        Gap(4.h),
        ProgressBar(
          progress: 75,
          total: 100,
          hasMargin: false,
          color: Color(0xFF29CB97),
          fillColor: Color(0xFFF91414),
        ),
        Gap(4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              '75',
              fontSize: 14.sp,
            ),
            MyText(
              '25',
              fontSize: 14.sp,
            ),
          ],
        ),
      ],
    );
  }

  Widget _label(String text, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MyText(
          text,
          fontSize: 14.sp,
        ),
        Gap(8.w),
        CircleAvatar(
          radius: 8.r,
          backgroundColor: color,
        ),
      ],
    );
  }
}

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
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
                    onTap: () => Get.back(),
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
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
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
                    hint: 'Select State',
                    itemList: const [
                      'Abia',
                      'Adamawa',
                      'Akwa-Ibom',
                      'Benue',
                      'Ekiti',
                      'Jigawa',
                    ],
                    onChanged: (value) {},
                    hasLabel: false,
                    fillColor: kBorderColor,
                    isDense: true,
                  ),
                  Gap(20.h),
                  DropDownMenuWidget(
                    hint: 'Select LGA',
                    itemList: const [
                      'Abia',
                      'Adamawa',
                      'Akwa-Ibom',
                      'Benue',
                      'Ekiti',
                      'Jigawa',
                    ],
                    onChanged: (value) {},
                    hasLabel: false,
                    fillColor: kBorderColor,
                    isDense: true,
                  ),
                  Gap(24.h),
                  OnTapFade(
                    onTap: () {},
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
                            onTap: () {},
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
                            onTap: () {},
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
  }
}
