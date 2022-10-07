import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/review_widget.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class VendorPromotionDetailsView extends StatelessWidget {
  static const String route = '/vendor_promotion_details_view';
  const VendorPromotionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        titleText: 'Promotion',
        titleColor: kWhite,
        centerTitle: false,
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
              color: kPrimaryBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset(
                        Assets.cokeImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Gap(50.h),
                ],
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
                    Center(
                      child: MyText(
                        'Discount starts 28th,June. Ends 28th July...',
                        color: kPrimaryRed,
                        fontStyle: FontStyle.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          'Father\'s Day',
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                          color: kBlack,
                        ),
                        OnTapFade(
                          onTap: () {},
                          child: Row(
                            children: [
                              MyText(
                                'Edit',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                fontStyle: FontStyle.poppins,
                              ),
                              Gap(12.w),
                              RotatedBox(
                                quarterTurns: 135,
                                child: SvgPicture.asset(
                                  Assets.downArrowIcon,
                                  width: 3.w,
                                  height: 5.h,
                                  color: kTextGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      'Nike React Backpack',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: kBlack.withOpacity(0.7),
                    ),
                    Gap(4.h),
                    RichText(
                      text: TextSpan(
                        text: '\$4600',
                        style: kStylePoppins.copyWith(
                            color: kPrimaryBlue,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none),
                        children: [
                          const TextSpan(
                              text: ' ',
                              style:
                                  TextStyle(decoration: TextDecoration.none)),
                          TextSpan(
                            text: '\$5600',
                            style: kStylePoppins.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: kScrollGrey,
                                decoration: TextDecoration.lineThrough),
                          ),
                          const TextSpan(
                              text: '  ',
                              style:
                                  TextStyle(decoration: TextDecoration.none)),
                          TextSpan(
                              text: '25% OFF',
                              style: kStylePoppins.copyWith(
                                  color: kPrimaryRed,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.none)),
                        ],
                      ),
                    ),
                    Gap(24.h),
                    Row(
                      children: [
                        CardButton(
                          label: 'Approve',
                          color: kPrimaryGreen,
                          textColor: kWhite,
                          alignToCenter: false,
                          borderRadius: 16.r,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 6.h),
                        ),
                        Gap(16.w),
                        OnTapFade(
                            onTap: () {},
                            child: SvgPicture.asset(
                              Assets.shareIcon,
                              width: 28.r,
                              height: 28.r,
                            ))
                      ],
                    ),
                    Gap(30.h),
                    MyText(
                      'About Product',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.poppins,
                    ),
                    Gap(4.h),
                    MyText(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet morbi tincidunt elit nunc. Ultricies nam sit pharetra, fringilla aliquet molestie. Id amet at sit fringilla turpis blandit eu sagit.',
                      fontSize: 12.sp,
                      fontStyle: FontStyle.poppins,
                    ),
                    Gap(24.h),
                    MyText(
                      'Review',
                      fontStyle: FontStyle.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                    Gap(12.h),
                    ReviewWidget(
                      name: 'Anonymous',
                      date: DateTime.now(),
                      comment:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet morbi tincidunt elit nunc. Ultricies nam sit pharetra.',
                      review: true,
                    ),
                    Gap(8.h),
                    Divider(
                      color: kTextGray,
                      height: 1.h,
                      thickness: 0.5,
                    ),
                    Gap(8.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
