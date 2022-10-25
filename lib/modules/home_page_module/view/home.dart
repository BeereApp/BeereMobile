import 'package:beere_mobile/modules/dashboard_module/controller/dashboard_controller.dart';
import 'package:beere_mobile/modules/home_page_module/controller/home_controller.dart';
import 'package:beere_mobile/modules/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/modules/settings_module/view/notification_view.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  static const String route = '/home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => Scaffold(
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
                        onTap: () {
                          // Navigator.of(context)
                          //     .pushNamed(NotificationView.route);
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
             Gap(200.h),
            MyText(
                'Beere',
                fontSize: 48.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.02.sp,
                fontStyle: FontStyle.poppins,
                color: kPrimaryBlue.withOpacity(0.4),
              ),
              Gap(15.h),
               InputWidget(
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
                    OnTapFade(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.micIcon),
                    ),
                    Gap(4.w),
                    OnTapFade(
                      onTap: () {
                        Get.dialog(const FilterDialog());
                      },
                      child: SvgPicture.asset(Assets.filterIcon),
                    ),
                    Gap(8.w),
                  ],
                ),
              ),
              Gap(16.h),
              Obx(()=> SizedBox(
                 height: 26.h,
                child: ReorderableListView(
                  padding: EdgeInsets.only(left: 8.w),
                  scrollDirection: Axis.horizontal,
                  onReorder: ((oldIndex, newIndex) =>
                          controller.reorder(oldIndex, newIndex)),
                  children: controller.productItem.map((e) => CardButton(
                    label: e,
                     key: ValueKey(e),
                     hasShadow: true,
                     margin: EdgeInsets.only(right: 14.w),
                    )
                  ).toList(),

                  ),
              )
              )
          ],
        ),
      ),
      ),
    );
  }
}
