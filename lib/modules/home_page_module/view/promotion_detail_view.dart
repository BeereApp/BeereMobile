import 'package:beere_mobile/modules/home_page_module/controller/promotion_controller.dart';
import 'package:beere_mobile/modules/home_page_module/view/user_view_vendor_page.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/utils/extensions.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/rating_bar.dart';
import 'package:beere_mobile/widgets/review_widget.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PromotionDetailView extends StatelessWidget {
  static const String route = '/promotion_detail_view';

  const PromotionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromotionController>(builder: (controller) {
      final model = controller.selectedPromotion!;
      final discountPrice = model.price * (model.discount / 100);
      final offer = model.price - discountPrice;
      return Scaffold(
        appBar: customAppbar(
          context,
          titleText: 'Promotion',
          centerTitle: false,
        ),
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 220.h,
                  child: Card(
                    elevation: 2,
                    color: kWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r)),
                    shadowColor: kPrimaryBlue,
                    child: Padding(
                      padding: EdgeInsets.all(16.0.r),
                      child: Center(
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          // width: 97.r,
                          // height: 97.r,
                          imageUrl: model.productImage,
                          errorWidget: (context, url, error) => Icon(
                            Icons.question_mark,
                            size: 100.r,
                            color: kBlack,
                          ),
                          placeholder: (context, url) => Icon(
                            Icons.question_mark,
                            size: 100.r,
                            color: kBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(16.h),
                Row(
                  children: [
                    OnTapFade(
                      onTap: () {
                        //Navigator.of(context).pushNamed(UserViewVendorPage.route);
                        Get.toNamed(UserViewVendorPage.route);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Duke\'s Farm\n',
                          style: kStylePoppins.copyWith(
                            color: kPrimaryBlue,
                            fontSize: 13.sp,
                          ),
                          children: [
                            TextSpan(
                              text: 'Ikeja, Lagos.',
                              style: kStylePoppins.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    OnTapFade(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.shareIcon,
                          width: 24.r, height: 24.r),
                    ),
                    Gap(16.w),
                    OnTapFade(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.whatsappIcon,
                          width: 24.r, height: 24.r),
                    ),
                    Gap(16.w),
                    OnTapFade(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.phoneIcon,
                          width: 24.r, height: 24.r),
                    ),
                  ],
                ),
                Gap(4.h),
                MyText(
                  model.productName,
                  fontSize: 24.sp,
                  color: kBlack,
                  fontStyle: FontStyle.poppins,
                  fontWeight: FontWeight.w600,
                  height: (35.4 / 24).sp,
                ),
                MyText(
                  model.productType,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: (17.42 / 16).sp,
                ),
                MyText(
                  '${model.promotionStarts.formatDayMonth}'
                  '. Ends ${model.promotionEnds.formatDayMonth}',
                  fontSize: 13.sp,
                  color: kPrimaryRed,
                  fontStyle: FontStyle.poppins,
                  fontWeight: FontWeight.w500,
                  height: (18.42 / 12).sp,
                ),
                Gap(16.h),
                RichText(
                  text: TextSpan(
                    text: offer.formatToAmount,
                    style: TextStyle(
                        color: kPrimaryBlue,
                        fontSize: 24.17.sp,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none),
                    children: [
                      TextSpan(
                        text: model.price.formatToAmount,
                        style: TextStyle(
                            color: kScrollGrey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.lineThrough),
                      ),
                      TextSpan(
                        text: '  ${model.discount}% OFF',
                        style: kStylePoppins.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: kPrimaryRed,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                Gap(14.h),
                MyText(
                  'About Product',
                  fontStyle: FontStyle.poppins,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                Gap(5.h),
                MyText(
                  model.description,
                  fontStyle: FontStyle.poppins,
                  fontSize: 13.sp,
                ),
                Gap(16.h),
                const RatingBar(
                  rating: 4,
                ),
                Gap(2.h),
                MyText(
                  '(55k ratings)',
                  fontStyle: FontStyle.poppins,
                  color: kBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
                Gap(14.h),
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
      );
    });
  }
}
