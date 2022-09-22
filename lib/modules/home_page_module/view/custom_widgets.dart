import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.label,
    this.hasShadow = false,
    this.shadowColor,
    this.color,
    this.textColor,
    this.fontSize,
    this.onTap,
    this.borderRadius,
    this.border,
    this.fontWeight,
    this.padding,
    this.margin,
  });

  final String label;
  final bool hasShadow;
  final Color? shadowColor;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onTap;
  final double? borderRadius;
  final BoxBorder? border;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return OnTapFade(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: margin,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          border: border,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: color ?? kPrimaryBlue.withOpacity(0.1),
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                  )
                ]
              : null,
          color: color ?? kWhite,
        ),
        child: MyText(
          label,
          textAlign: TextAlign.center,
          color: textColor,
          fontStyle: FontStyle.poppins,
          fontSize: fontSize ?? 11.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.elevation,
    required this.promoText,
    required this.productText,
    required this.productDescription,
    this.oldPrice,
    this.newPrice,
    this.buttonColor,
    this.onTap,
    required this.image,
    this.margin,
  });

  final double? elevation;
  final String promoText;
  final String productText;
  final String productDescription;
  final String? oldPrice;
  final String? newPrice;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final String image;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      elevation: elevation ?? 4,
      color: kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      shadowColor: kPrimaryBlue,
      child: Container(
        height: 185.h,
        width: 320.w,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    promoText,
                    fontWeight: FontWeight.w900,
                    color: kBlack,
                    fontSize: 19.5.sp,
                    letterSpacing: 0.045.sp,
                    height: (20.5 / 19.5).sp,
                    fontStyle: FontStyle.poppins,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(8.h),
                  MyText(
                    productText,
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                    color: kBlack,
                    fontStyle: FontStyle.poppins,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(2.h),
                  MyText(
                    productDescription,
                    fontSize: 8.sp,
                    fontStyle: FontStyle.poppins,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(16.h),
                  Row(
                    children: [
                      CardButton(
                        label: 'ORDER NOW',
                        fontSize: 9.sp,
                        onTap: onTap,
                        color: buttonColor ?? kPrimaryGreen,
                        textColor: kWhite,
                      ),
                      Gap(8.w),
                      RichText(
                        text: TextSpan(
                          text: oldPrice != null ? '\$$oldPrice' : '',
                          style: kStylePoppins.copyWith(
                              color: kScrollGrey,
                              fontSize: 14.sp,
                              decoration: TextDecoration.lineThrough),
                          children: [
                            const TextSpan(
                                text: ' ',
                                style:
                                    TextStyle(decoration: TextDecoration.none)),
                            TextSpan(
                              text: newPrice != null ? '\$$newPrice' : '',
                              style: kStylePoppins.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.sp,
                                  color: kBlack,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListIndicator extends StatelessWidget {
  const
  ListIndicator({super.key, required this.position, required this.count});

  final int position;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DotsIndicator(
            dotsCount: count,
            position: position.toDouble(),
            decorator: DotsDecorator(
                color: Colors.transparent,
                activeColor: kPrimaryBlue,
                shape: const CircleBorder(
                    side: BorderSide(color: kPrimaryBlue, width: 0.5)),
                activeSize: Size(15.w, 8.h),
                spacing: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r))),
          ),
        ),
      ),
    );
  }
}
