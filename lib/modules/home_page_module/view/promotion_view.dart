import 'package:beere_mobile/modules/home_page_module/controller/promotion_controller.dart';
import 'package:beere_mobile/modules/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/extensions.dart';
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

class PromotionView extends StatelessWidget {
  static const String route = '/promotion_view';

  const PromotionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromotionController>(builder: (controller) {
      return Scaffold(
        appBar: customAppbar(context,
            titleText: 'Promotion',
            centerTitle: false,
            actions: [
              OnTapFade(
                onTap: () {},
                child: SvgPicture.asset(Assets.searchIcon,
                    width: 24.r, height: 24.r),
              ),
              Gap(16.w),
            ]),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.value(controller.fetchPromotions());
          },
          color: kPrimaryBlue,
          strokeWidth: 3,
          child: Background(
            child: Column(
              children: [
                Row(
                  children: [
                    OnTapFade(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.filterIcon,
                          width: 24.r, height: 24.r),
                    ),
                    Gap(14.w),
                    Obx(() => Expanded(
                          child: SizedBox(
                            height: 28.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.categoryList.length,
                                itemBuilder: (context, index) {
                                  return CardButton(
                                    label: controller.categoryList[index],
                                    hasShadow: true,
                                    margin: EdgeInsets.only(right: 14.w),
                                  );
                                }),
                          ),
                        )),
                  ],
                ),
                Gap(16.h),
                Obx(
                  () => Expanded(
                    child: controller.isProcessing
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryBlue,
                            ),
                          )
                        : controller.promotions.isEmpty
                            ? Center(
                                child: MyText(
                                  'No promotions to show!',
                                  fontSize: 28.sp,
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.promotions.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final promotion =
                                      controller.promotions[index];
                                  final discountPrice = promotion.price *
                                      (promotion.discount / 100);
                                  final offer = promotion.price - discountPrice;
                                  return OnTapFade(
                                    onTap: () {
                                      controller.gotoDetailsView(promotion);
                                    },
                                    child: ProductCard(
                                      promoText:
                                          '${promotion.discount}% Discount Available On',
                                      productText: promotion.productName,
                                      productDescription: promotion.description,
                                      image: promotion.productImage,
                                      oldPrice: promotion.price.formatToAmount,
                                      newPrice: offer.formatToAmount,
                                      margin: EdgeInsets.only(bottom: 20.h),
                                    ),
                                  );
                                }),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
