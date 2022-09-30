import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gapage:get/get.dart';

class VendorHomePage extends StatelessWidget {
  static const String route = '/vendor_home_page';
  const VendorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      'Welcome,',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.02.sp,
                      fontStyle: FontStyle.poppins,
                    ),
                    MyText(
                      'Samson,',
                      fontSize: 14.sp,
                      letterSpacing: -0.02.sp,
                      fontStyle: FontStyle.poppins,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: OnTapFade(
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.notificationActiveIcon,
                          height: 28.r,
                          width: 28.r,
                        ),
                      ),
                    ),
                    OnTapFade(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundImage: const AssetImage(Assets.avatarImage),
                      ),
                    )
                  ],
                )
              ],
            ),
            Gap(10.h),
            InputWidget(
              label: true,
              filled: false,
              hintText: 'Search products, vendors, brands...',
              prefixIcon: SvgPicture.asset(
                Assets.searchIcon,
                fit: BoxFit.scaleDown,
                width: 20.r,
                height: 20.r,
              ),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OnTapFade(
                    onTap: () {},
                    child: SvgPicture.asset(Assets.micIcon),
                  ),
                  Gap(4.w),
                  OnTapFade(
                    onTap: () {},
                    child: SvgPicture.asset(Assets.filterIcon),
                  ),
                  Gap(8.w),
                ],
              ),
            ),
            Gap(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MyText(
                      "Location",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.poppins,
                      letterSpacing: 0.5.sp,
                      height: 21 / 16,
                      color: kTextGray,
                    ),
                    OnTapFade(
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.downArrowIcon,
                          color: kTextGray,
                        ))
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      "This Month",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryBlue,
                    ),
                    OnTapFade(
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.downArrowIcon,
                          color: kPrimaryBlue,
                        ))
                  ],
                )
              ],
            ),
            Gap(10.h),
            SizedBox(
              height: 100.h,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(6.h),
                          Row(
                            children: [
                              MyText(
                                "10%",
                                fontSize: 12.sp,
                                color: kPrimaryGreen,
                                fontStyle: FontStyle.poppins,
                                height: 16 / 12,
                              ),
                              const Icon(
                                Icons.arrow_upward,
                                color: kPrimaryGreen,
                              )
                            ],
                          ),
                          Gap(6.h),
                          MyText(
                            "60",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: kTextGray,
                            height: 32 / 24,
                            fontStyle: FontStyle.poppins,
                          ),
                          Gap(6.h),
                          MyText(
                            "Search Appearance",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: kScrollGrey,
                            height: 14 / 11,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: kSecondaryBlue,
                        ),
                        child: OnTapFade(
                          onTap: () {},
                          child: SvgPicture.asset(
                            Assets.searchIcon2,
                            //fit: BoxFit.scaleDown,
                            width: 24.r,
                            height: 24.r,
                            color: kPrimaryBlue,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  'Top Search Items',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.poppins,
                  letterSpacing: 0.01.sp,
                  height: 21 / 14,
                  color: kTextGray,
                ),
                OnTapFade(
                  onTap: () {},
                  child: MyText(
                    'See All  >',
                    fontSize: 12.sp,
                    fontStyle: FontStyle.poppins,
                    height: 18 / 12,
                    color: kPrimaryBlue,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r)),
                    color: kSecondaryBlue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                MyText(
                                  "Category",
                                  color: kBlack,
                                  fontSize: 7.sp,
                                  fontStyle: FontStyle.poppins,
                                  height: 9 / 7,
                                ),
                                MyText(
                                  "Laptops",
                                  color: kPrimaryBlue,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  height: 13 / 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  "1780",
                                  textAlign: TextAlign.start,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  height: 32 / 24,
                                  color: kPrimaryBlue,
                                ),
                                MyText(
                                  "HP EliteBook 540",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  color: kScrollGrey,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    color: kSecondaryBlue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                MyText(
                                  "Category",
                                  color: kBlack,
                                  fontSize: 7.sp,
                                  fontStyle: FontStyle.poppins,
                                  height: 9 / 7,
                                ),
                                MyText(
                                  "Stationary",
                                  color: kPrimaryGreen,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  height: 13 / 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  "1200",
                                  textAlign: TextAlign.start,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  height: 32 / 24,
                                  color: kPrimaryGreen,
                                ),
                                MyText(
                                  "WhiteBoard",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  color: kScrollGrey,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  'Clicks on promotion',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.poppins,
                  height: 21 / 14,
                  letterSpacing: 0.01.sp,
                  color: kTextGray,
                ),
                OnTapFade(
                  onTap: () {},
                  child: MyText(
                    'This Month  >',
                    fontSize: 14.sp,
                    height: 18 / 12,
                    fontStyle: FontStyle.poppins,
                    color: kPrimaryBlue,
                  ),
                ),
              ],
            ),
            Gap(10.h),
            SizedBox(
              height: 100.h,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(6.h),
                          Row(
                            children: [
                              MyText(
                                "10%",
                                fontSize: 12.sp,
                                height: 16 / 12,
                                fontStyle: FontStyle.poppins,
                                color: kPrimaryGreen,
                              ),
                              const Icon(
                                Icons.arrow_upward,
                                color: kPrimaryGreen,
                              )
                            ],
                          ),
                          Gap(6.h),
                          MyText(
                            "1067",
                            fontSize: 24.sp,
                            height: 32 / 24,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.poppins,
                            color: kTextGray,
                          ),
                          Gap(6.h),
                          MyText(
                            "Clicks on promotion",
                            fontSize: 10.sp,
                            height: 13 / 10,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.poppins,
                            color: kScrollGrey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: kPrimaryGreen.withOpacity(0.2),
                        ),
                        child: OnTapFade(
                          onTap: () {},
                          child: SvgPicture.asset(
                            Assets.touchIcon,
                            width: 30.r,
                            height: 30.r,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  'Order on products',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.poppins,
                  letterSpacing: 0.01.sp,
                  height: 21 / 14,
                  color: kTextGray,
                ),
                OnTapFade(
                  onTap: () {},
                  child: MyText(
                    'This Month  >',
                    fontSize: 12.sp,
                    height: 18 / 12,
                    fontStyle: FontStyle.poppins,
                    color: kPrimaryBlue,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyText("10%",
                                    color: kPrimaryRed,
                                    fontSize: 14.sp,
                                    height: 16 / 12,
                                    fontStyle: FontStyle.poppins),
                                const Icon(
                                  Icons.arrow_downward,
                                  color: kPrimaryRed,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(right: 45),
                            padding: const EdgeInsets.only(left: 10),
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: kSecondaryBlue,
                            ),
                            child: OnTapFade(
                              onTap: () {},
                              child: SvgPicture.asset(
                                Assets.stackIcon,
                                width: 24.r,
                                height: 22.r,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  "56",
                                  textAlign: TextAlign.start,
                                  fontSize: 24.sp,
                                  height: 32 / 24,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  color: kTextGray,
                                ),
                                MyText(
                                  "Orders Completed",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  color: kTextGray,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyText("10%",
                                    color: kPrimaryGreen,
                                    fontSize: 14.sp,
                                    height: 16 / 12,
                                    fontStyle: FontStyle.poppins),
                                const Icon(
                                  Icons.arrow_upward,
                                  color: kPrimaryGreen,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(right: 45),
                            padding: const EdgeInsets.only(left: 10),
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: kPrimaryYellow.withOpacity(0.2),
                            ),
                            child: OnTapFade(
                              onTap: () {},
                              child: SvgPicture.asset(
                                Assets.fileIcon,
                                width: 24.r,
                                height: 22.r,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  "104",
                                  textAlign: TextAlign.start,
                                  height: 32 / 24,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  color: kTextGray,
                                ),
                                MyText(
                                  "Orders Received",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.poppins,
                                  color: kScrollGrey,
                                  height: 13 / 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
