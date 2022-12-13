import 'package:beere_mobile/modules/dashboard_module/controller/dashboard_controller.dart';
import 'package:beere_mobile/modules/settings_module/view/notification_view.dart';
import 'package:beere_mobile/modules/vendor/home_page_module/controller/vendor_homepage_controller.dart';
import 'package:beere_mobile/modules/vendor/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    return GetX<VendorHomePageController>(
        init: VendorHomePageController(),
        builder: (controller) {
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
                              controller.profile.firstName,
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
                                final dashboard =
                                    Get.find<DashboardController>();
                                dashboard.tabController.jumpToTab(1);
                                dashboard.selectedIndex = 1;
                              },
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 32.r,
                                  height: 32.r,
                                  imageUrl:
                                      controller.profile.model?.personalImage ??
                                          '',
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    Assets.avatarImage,
                                    width: 32.r,
                                    height: 32.r,
                                    fit: BoxFit.cover,
                                  ),
                                  placeholder: (context, url) => Image.asset(
                                    Assets.avatarImage,
                                    width: 32.r,
                                    height: 32.r,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Gap(10.h),
                    InputWidget(
                      readOnly: true,
                      onTap: () => controller.search(),
                      hasLabel: false,
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
                          // SvgPicture.asset(Assets.micIcon),
                          // Gap(4.w),
                          SvgPicture.asset(Assets.filterIcon),
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
                      number: '60',
                      text: 'Customer Engagement',
                      iconColor: Color(0xFF574FF9),
                      icon: Assets.usersIcon,
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
                    const VendorCard1(
                        percent: '10',
                        number: '1067',
                        text: 'Clicks on Promotion',
                        iconColor: kPrimaryGreen,
                        icon: Assets.touchIcon),
                    Gap(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          'Request on searches',
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
                        ),
                      ],
                    ),
                    Gap(10.h),
                    Row(
                      children: const [
                        Expanded(
                          child: VendorCard3(
                            number: '56',
                            text: 'Request Replied',
                            color: kPrimaryBlue,
                            icon: Assets.stackIcon,
                            percent: '10',
                            isPositive: false,
                          ),
                        ),
                        Expanded(
                          child: VendorCard3(
                            number: '104',
                            text: 'Request Received',
                            color: kPrimaryYellow,
                            icon: Assets.fileIcon,
                            percent: '10',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
