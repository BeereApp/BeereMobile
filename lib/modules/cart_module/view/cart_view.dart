import 'package:beere_mobile/modules/cart_module/view/custom_widgets.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  static const String route = '/cart_view';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        centerTitle: false,
        titleText: 'Cart',
        hasLeading: false,
      ),
      body: Background(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 110.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(Assets.cartImage),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    // child: Image(
                    //   image: AssetImage(Assets.cartImage),
                    //   width: 135.w,
                    //   height: 100.h,
                    // ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        'Banana Pizza',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.poppins,
                        color: kBlack,
                      ),
                      Gap(2.h),
                      MyText(
                        '3 pieces',
                        fontSize: 15.sp,
                        fontStyle: FontStyle.poppins,
                      ),
                      Gap(2.h),
                      RichText(
                        text: TextSpan(
                          text: '\$03.',
                          style: kStylePoppins.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryBlue,
                          ),
                          children: [
                            TextSpan(
                              text: '00',
                              style: kStylePoppins.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryBlue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(12.h),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OnTapFade(
                            onTap: () {},
                            child: SvgPicture.asset(Assets.heartIcon,
                                width: 25.r, height: 25.r),
                          ),
                          OnTapFade(
                            onTap: () {},
                            child: SvgPicture.asset(Assets.deleteIcon,
                                width: 19.w, height: 23.h),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFEFF0ED),
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OnTapFade(
                            onTap: () {},
                            child: MyText(
                              '-',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: kBlack,
                            ),
                          ),
                          MyText(
                            '1',
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                            color: kBlack,
                          ),
                          OnTapFade(
                            onTap: () {},
                            child: MyText(
                              '+',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: kBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    'Total',
                    fontSize: 16.sp,
                    fontStyle: FontStyle.poppins,
                    color: kBlack,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\$03.',
                      style: kStylePoppins.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: kBlack,
                      ),
                      children: [
                        TextSpan(
                          text: '00',
                          style: kStylePoppins.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: kBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: kLightGray,
                height: 1.h,
                thickness: 0.5,
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    'Door-step Delivery',
                    fontSize: 18.sp,
                    fontStyle: FontStyle.poppins,
                  ),
                  CartButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.check,
                      size: 20.r,
                      color: kPrimaryBlue,
                    ),
                  ),
                ],
              ),
              Gap(10.h),
              Divider(
                color: kLightGray,
                height: 1.h,
                thickness: 0.5,
              ),
              Gap(8.h),
              Row(
                children: [
                  MyText(
                    'Address',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.poppins,
                  ),
                  Gap(5.w),
                  CartButton(
                    onPressed: () {},
                    text: ' Edit > ',
                  )
                ],
              ),
              Gap(12.h),
              MyText(
                'Dolor Lorem magna commodo nulla voluptate\nnostrud dolor commodo nisi laborum aliqua duis\nvelit laborum.',
                fontSize: 13.sp,
                fontStyle: FontStyle.poppins,
              ),
              Gap(5.h),
              MyText(
                'Contact details',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.poppins,
              ),
              MyText(
                '+23470112623',
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.poppins,
              ),
              MyText(
                'joshuaaleke0@gmail.com',
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.poppins,
              ),
              Gap(5.h),
              Divider(
                color: kLightGray,
                height: 1.h,
                thickness: 0.5,
              ),
              Gap(10.h),
              Row(
                children: [
                  MyText(
                    'In-Store Delivery',
                    fontSize: 18.sp,
                    fontStyle: FontStyle.poppins,
                  ),
                  Gap(12.w),
                  CartButton(
                    onPressed: () {},
                    text: ' Choose Store > ',
                  ),
                  const Spacer(),
                  CartButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.check,
                      size: 20.r,
                      color: Colors.transparent,
                    ),
                  )
                ],
              ),
              Gap(10.h),
              Divider(
                color: kLightGray,
                height: 1.h,
                thickness: 0.5,
              ),
              Gap(5.h),
              MyText(
                "Dolor Lorem magna commodo nulla voluptate\nnostrud dolor commodo nisi laborum aliqua duis\nvelit laborum. Dolor Lorem magna commodo nulla\nvoluptate nostrud dolor commodo nisi laborum\naliqua duis velit laborum. Dolor Lorem magna\ncommodo nulla voluptate nostrud dolor commodo\nnisi laborum aliqua duis velit laborum.  ",
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.poppins,
              ),
              Gap(24.h),
              PrimaryButton(
                onPressed: () {},
                text: 'Complete',
              ),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
