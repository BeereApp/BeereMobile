import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

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
