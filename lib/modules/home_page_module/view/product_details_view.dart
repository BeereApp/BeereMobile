import 'package:beere_mobile/modules/cart_module/view/cart_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/rating_bar.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatelessWidget {
  static const String route = '/product_details_view';

  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        titleText: 'Detail',
        titleColor: kWhite,
        centerTitle: false,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OnTapFade(
                onTap: () {
                  Get.toNamed(CartView.route);
                },
                child: SvgPicture.asset(
                  Assets.addToCartIcon,
                  width: 25.r,
                  height: 25.r,
                ),
              ),
            ],
          ),
          Gap(24.w),
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
                    MyText(
                      'Coca-cola Can',
                      color: kBlack,
                      fontStyle: FontStyle.poppins,
                      fontWeight: FontWeight.w600,
                      fontSize: 28.sp,
                    ),
                    MyText(
                      'Coca-cola plc',
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '\$03.',
                            style: kStylePoppins.copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: kPrimaryBlue,
                            ),
                            children: [
                              TextSpan(
                                text: '00',
                                style: kStylePoppins.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryBlue,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(width: 0.5),
                          ),
                          child: Column(
                            children: [
                              RotatedBox(
                                quarterTurns: 90,
                                child: SvgPicture.asset(
                                  Assets.downArrow,
                                  width: 4.w,
                                  height: 7.h,
                                  color: kPrimaryBlue,
                                ),
                              ),
                              Gap(12.h),
                              MyText(
                                '1',
                                color: kBlack,
                                fontWeight: FontWeight.w600,
                                fontSize: 26.sp,
                              ),
                              Gap(12.h),
                              SvgPicture.asset(
                                Assets.downArrow,
                                width: 4.w,
                                height: 7.h,
                                color: kPrimaryBlue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const RatingBar(rating: 4),
                    Gap(6.h),
                    MyText(
                      '(55k ratings)',
                      height: 1,
                      color: kBlack,
                      fontSize: 13.sp,
                      fontStyle: FontStyle.poppins,
                    ),
                    Gap(24.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: PrimaryButton(
                            onPressed: () {
                              Get.toNamed(CartView.route);
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 14.w),
                            hasOuterPadding: false,
                            text: 'Add to Cart',
                            textStyle: kStylePoppins.copyWith(
                              color: kWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Gap(20.w),
                        Expanded(
                          flex: 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OnTapFade(
                                onTap: () {},
                                child: SvgPicture.asset(Assets.shareIcon,
                                    width: 28.r, height: 28.r),
                              ),
                              OnTapFade(
                                onTap: () {},
                                child: SvgPicture.asset(Assets.heartIcon,
                                    width: 28.r, height: 28.r),
                              ),
                              OnTapFade(
                                onTap: () {},
                                child: SvgPicture.asset(Assets.whatsappIcon,
                                    width: 28.r, height: 28.r),
                              ),
                              OnTapFade(
                                onTap: () {},
                                child: SvgPicture.asset(Assets.phoneIcon,
                                    width: 28.r, height: 28.r),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(24.h),
                    MyText(
                      'About Product',
                      color: kBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.poppins,
                    ),
                    Gap(4.h),
                    MyText(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet morbi tincidunt elit nunc. Ultricies nam sit pharetra, fringilla aliquet molestie. Id amet at sit fringilla turpis blandit eu sagit.',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.poppins,
                    ),
                    Gap(24.h),
                    MyText(
                      'Other Products',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.poppins,
                    ),
                    for (int i = 0; i < 2; i++)
                      const ProductCard(
                          promoText: 'Product Of The Week',
                          productText: 'Classic Office Bags',
                          productDescription:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet morbi tincidunt elit nunc. Ultricies nam sit pharetra, fringilla aliquet molestie. Id amet at sit fringilla turpis blandit eu sagit.',
                          image: Assets.pearImage)
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
