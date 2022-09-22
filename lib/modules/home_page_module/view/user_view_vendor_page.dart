import 'package:beere_mobile/modules/home_page_module/view/user_vendor_more_info_page.dart';
import 'package:beere_mobile/modules/home_page_module/view/user_vendor_more_review_page.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'custom_widgets.dart';

class UserViewVendorPage extends StatelessWidget {
  static const String route = '/user_view_vendor_view';
  const UserViewVendorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        titleText: 'Profile',
        titleColor: kWhite,
        centerTitle: false,
        actions: [
          Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: const Color(0x80C4C4C4),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  Assets.globeIcon,
                  width: 25.r,
                  height: 25.r,
                ),
                Gap(16.w),
                SvgPicture.asset(
                  Assets.whatsappIcon,
                  width: 25.r,
                  height: 25.r,
                ),
                Gap(16.w),
                SvgPicture.asset(
                  Assets.phoneIcon,
                  width: 25.r,
                  height: 25.r,
                ),
              ],
            ),
          ),
          Gap(16.w),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.vendorProfileBGImage),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 45.r,
                  backgroundColor: kWhite,
                  child: CircleAvatar(
                    radius: 44.r,
                    child: Image.asset(
                      Assets.vendorProfileAvatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.64,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        MyText(
                          'Ebeano Store',
                          fontStyle: FontStyle.poppins,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: kBlack,
                        ),
                        MyText(
                          'Ikeja, Lagos NG',
                          fontStyle: FontStyle.poppins,
                          fontSize: 13.sp,
                          color: kPrimaryBlue,
                        ),
                        Gap(4.h),
                        MyText(
                          'Phones & Tablets Electronics Fashion Health & Beauty store',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          fontStyle: FontStyle.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                    Gap(16.h),
                    MyText(
                      'Verified vendor',
                      fontStyle: FontStyle.poppins,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: kPrimaryGreen,
                    ),
                    Gap(2.h),
                    Row(
                      children: [
                        _verifiedStatusWidget('Email', true),
                        _verifiedStatusWidget('SMS', true),
                        _verifiedStatusWidget('KYC', true),
                        _verifiedStatusWidget('CAC', false),
                      ],
                    ),
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          'Info',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.poppins,
                          letterSpacing: 0.01.sp,
                          color: kBlack,
                        ),
                        OnTapFade(
                          onTap: () {
                            Get.toNamed(UserVendorMoreInfoView.route);
                          },
                          child: MyText(
                            'more  >',
                            fontSize: 14.sp,
                            color: kPrimaryBlue,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.poppins,
                          ),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    _infoWidget('Trades', '1695'),
                    Gap(8.h),
                    _infoWidget('Completion rates', '80.05%'),
                    Gap(8.h),
                    _infoWidget('Comments', '{1845}'),
                    Gap(8.h),
                    OnTapFade(
                        onTap: () =>
                            Get.toNamed(UserVendorMoreReviewView.route),
                        child: _infoWidget('Positive Feedback', '94.00% >')),
                    Gap(18.h),
                    MyText(
                      'Available Promotions',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.poppins,
                    ),
                    Gap(16.h),
                    for (int i = 0; i < 2; i++)
                      const ProductCard(
                        promoText: '15% Discount Available On',
                        productText: 'Fresh Basket Of Pear',
                        productDescription:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing  aliquet molestie. Id amet at sit fringilla turpis blandit eu sagit.',
                        image: Assets.pearImage,
                        oldPrice: '35',
                        newPrice: '27',
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _verifiedStatusWidget(String text, bool status) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText(
          text,
          fontStyle: FontStyle.poppins,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        Gap(4.w),
        SvgPicture.asset(Assets.checkIcon,
            width: 12.sp, height: 12.sp, color: status ? kPrimaryYellow : null),
        Gap(12.w),
      ],
    );
  }

  Widget _infoWidget(String text1, String text2) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: kStylePoppins.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: ' $text2',
            style: kStylePoppins.copyWith(
              fontSize: 16.sp,
              color: kPrimaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
