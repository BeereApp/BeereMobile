import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'vendor_add_location_view.dart';

class VendorLocationView extends StatelessWidget {
  static const String route = '/vendor_location_view';

  const VendorLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        titleText: 'Location',
        centerTitle: false,
      ),
      body: Background(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      color: kWhite,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 26.0.w,
                            right: 26.0.w,
                            top: 20.h,
                            bottom: 10.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    'Ajah, Lagos',
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.poppins,
                                    color: kBlack,
                                  ),
                                  MyText(
                                    '15, B-niger St, Ibeju-Lekki , Lagos\nNigeria',
                                    fontSize: 10.sp,
                                    height: (18 / 10).sp,
                                    fontStyle: FontStyle.poppins,
                                    color: kBlack.withOpacity(0.61),
                                  ),
                                  Gap(8.h),
                                  MyText(
                                    '07012345678\njoshuaaleke@gmail.com',
                                    fontSize: 10.sp,
                                    height: (18 / 10).sp,
                                    fontStyle: FontStyle.poppins,
                                    color: kBlack.withOpacity(0.61),
                                  ),
                                ],
                              ),
                            ),
                            OnTapFade(
                              onTap: () {},
                              child: SvgPicture.asset(
                                Assets.editIcon,
                                width: 26.r,
                                height: 26.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0.w),
                child: ButtonWithIcon(
                  text: 'Add New Location',
                  icon: Icon(
                    Icons.add,
                    color: kWhite,
                    size: 26.r,
                  ),
                  onTap: () {
                    Get.toNamed(VendorAddLocationView.route);
                  },
                  textColor: kWhite,
                  color: kPrimaryBlue,
                  spacing: 16.w,
                  horizontalPadding: 24.w,
                ),
              ),
            ),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
