import 'package:beere_mobile/modules/dashboard_module/controller/dashboard_controller.dart';
import 'package:beere_mobile/modules/settings_module/view/notification_view.dart';
import 'package:beere_mobile/modules/vendor/business_module/view/vendor_notification_view.dart';
import 'package:beere_mobile/modules/vendor/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/modules/vendor/settings_module/view/vendor_statistics_view.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/switch_button.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VendorHomePage extends StatelessWidget {
  static const String route = '/vendor_home_page';

  const VendorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
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
                        'Samson',
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
                          onTap: () {
                            Get.toNamed(NotificationView.route);
                          },
                          child: SvgPicture.asset(
                            Assets.notificationActiveIcon,
                            height: 28.r,
                            width: 28.r,
                          ),
                        ),
                      ),
                      OnTapFade(
                        onTap: () {
                          final dashboard = Get.find<DashboardController>();
                          dashboard.tabController.jumpToTab(1);
                          dashboard.selectedIndex = 1;
                        },
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
                hasLabel: true,
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
              // Gap(12.h),
              // SwitchButton(
              //   text1: 'Store Stat',
              //   text2: 'Location Stat',
              //   onOnePressed: () {},
              //   onTwoPressed: () {},
              // ),
              Gap(16.h),
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
                      Gap(5.w),
                      SvgPicture.asset(
                        Assets.dotIcon,
                        width: 8.r,
                        height: 8.r,
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
              OnTapFade(
                onTap: () {
                  Get.toNamed(VendorStatisticsView.route);
                },
                child: const VendorCard1(
                  percent: '10',
                  number: '60',
                  text: 'Customer Engagement',
                  iconColor: Color(0xFF574FF9),
                  icon: Assets.userIcon,
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
                  ),
                  OnTapFade(
                    onTap: () {},
                    child: Row(
                      children: [
                        MyText(
                          'see all',
                          fontSize: 13.sp,
                          color: kPrimaryBlue,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.poppins,
                        ),
                        Gap(8.w),
                        RotatedBox(
                          quarterTurns: 135,
                          child: SvgPicture.asset(
                            Assets.downArrowIcon,
                            color: kPrimaryBlue,
                            width: 10.r,
                            height: 10.r,
                          ),
                        ),
                        Gap(12.w),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(5.h),
              Row(
                children: const [
                  Expanded(
                    child: VendorCard2(
                      category: 'Laptops',
                      value: '1780',
                      productName: 'Hp Elitebook 540',
                      color: kPrimaryBlue,
                    ),
                  ),
                  Expanded(
                    child: VendorCard2(
                      category: 'Stationary',
                      value: '1200',
                      productName: 'WhiteBoard',
                      color: kPrimaryGreen,
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
              OnTapFade(
                onTap: () {
                  Get.toNamed(VendorStatisticsView.route);
                },
                child: const VendorCard1(
                    percent: '10',
                    number: '1067',
                    text: 'Clicks on Promotion',
                    iconColor: kPrimaryGreen,
                    icon: Assets.touchIcon),
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
              Row(
                children: [
                  Expanded(
                    child: OnTapFade(
                      onTap: () {
                        Get.toNamed(VendorNotificationView.route);
                      },
                      child: const VendorCard3(
                        number: '56',
                        text: 'Orders Completed',
                        color: kPrimaryBlue,
                        icon: Assets.stackIcon,
                        percent: '10',
                        isPositive: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: OnTapFade(
                      onTap: () {
                        Get.toNamed(VendorNotificationView.route);
                      },
                      child: const VendorCard3(
                        number: '104',
                        text: 'Orders Received',
                        color: kPrimaryYellow,
                        icon: Assets.fileIcon,
                        percent: '10',
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
