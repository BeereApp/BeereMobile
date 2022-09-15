import 'package:beere_mobile/modules/onboarding_module/controller/select_category_controller.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SelectCategoryView extends StatelessWidget {
  static const String route = '/select_category_view';
  const SelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectCategoryController>(
      init: SelectCategoryController(),
      builder: (controller) => Scaffold(
        //extendBodyBehindAppBar: true,
        body: Background(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(75.h),
              MyText(
                'Select Category',
                fontSize: 26.sp,
                fontWeight: FontWeight.w800,
                color: kPrimaryBlue,
                letterSpacing: -0.02.sp,
              ),
              Gap(6.h),
              MyText(
                'Please select if you are a vendor/manufacturer or a customer',
                fontSize: 13.sp,
                interStyle: false,
              ),
              Gap(60.h),
              PrimaryButton(
                onPressed: () => controller.gotoUserPage(),
                textColor: kButtonColor,
                backgroundColor: Colors.white,
                text: 'USER',
              ),
              Gap(20.h),
              PrimaryButton(
                onPressed: () {},
                textColor: kButtonColor,
                backgroundColor: Colors.white,
                text: 'VENDOR',
              ),
              Gap(20.h),
              PrimaryButton(
                onPressed: () {},
                textColor: kButtonColor,
                backgroundColor: Colors.white,
                text: 'MANUFACTURER',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
