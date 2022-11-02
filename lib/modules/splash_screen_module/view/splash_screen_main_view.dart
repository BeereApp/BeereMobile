import 'package:beere_mobile/modules/splash_screen_module/controller/splash_screen_controller.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  static const String route = '/splash_screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) => Scaffold(
        backgroundColor: kPrimaryBlue,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.appLogo,
                        width: 79.w, height: 80.12.h),
                    Gap(10.h),
                    MyText(
                      'Beere',
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.poppins,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25.w, left: 25.w, bottom: 25.h),
              child: PrimaryButton(
                onPressed: () {},
                textColor: kPrimaryBlue,
                backgroundColor: Colors.white,
                text: 'GET STARTED',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
