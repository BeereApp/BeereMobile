import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AboutView extends StatelessWidget {
  static const String route = '/about_view';
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, titleText: 'About', centerTitle: false),
      body: Background(
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h, bottom: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: MyText(
                'About',
                fontStyle: FontStyle.poppins,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Center(
              child: MyText(
                'Beere',
                fontStyle: FontStyle.poppins,
                fontSize: 34.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(5.h),
            Divider(
              color: kLightGray,
              height: 1.h,
              thickness: 0.5,
            ),
            Gap(20.h),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              child: SingleChildScrollView(
                child: Center(
                  child: MyText(
                    'Lorem laborum officia nisi qui sunt incididunt amet minim velit dolor ullamco enim nostrud. Sit sunt ut tempor nulla anim anim ut aliqua in proident est. Elit et non nulla reprehenderit enim qui culpa. Exercitation voluptate sit excepteur deserunt qui ut ea et magna aliqua Lorem. Pariatur nisi et in nisi reprehenderit incididunt est qui. Ea nisi sit incididunt qui reprehenderit excepteur aliquip id. Eu laborum pariatur ex tempor. Ullamco exercitation veniam anim nostrud officia qui minim eu commodo. Ad cillum nostrud enim ipsum ea ex sint deserunt culpa irure laborum et.',
                    fontSize: 14.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Gap(24.h),
            Divider(
              color: kLightGray,
              height: 1.h,
              thickness: 0.5,
            ),
            Gap(20.h),
            MyText(
              'Follow us on Facebook',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.poppins,
              color: kBlack,
            ),
            Gap(16.h),
            MyText(
              'Follow us Instagram',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.poppins,
              color: kBlack,
            ),
            Gap(16.h),
            MyText(
              'Follow us on twitter',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.poppins,
              color: kBlack,
            ),
            Gap(20.h),
            Divider(
              color: kLightGray,
              height: 1.h,
              thickness: 0.5,
            ),
            Gap(20.h),
            MyText(
              'Terms of Use',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.poppins,
              color: kBlack,
            ),
            Gap(16.h),
            MyText(
              'Privacy Policy',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.poppins,
              color: kBlack,
            ),
            const Spacer(),
            Center(
              child: MyText(
                'Version 1.0.0',
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
