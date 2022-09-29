import 'package:beere_mobile/modules/vendor/tabs_screen_module/controller/tab_controller.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TabsScreen extends StatelessWidget {
  static const String route = '/tabs_screen';
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TabsController _tabx = Get.put(TabsController());
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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: TabBar(
                              controller: _tabx.controller,
                              tabs: _tabx.myTabs,
                            ),
                          ),
                           SizedBox(
                            height: 500.h,
                             child: TabBarView(
                  controller: _tabx.controller,
                  children: const [
                    Center(
                      child: Text('first'),
                    ),
                    Center(
                      child: Text('second'),
                    ),
                  ],
                ),
                           )
                        ],
                      ),

            ],
          ),
        ),

    );
  }
}
