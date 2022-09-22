import 'package:beere_mobile/modules/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/modules/home_page_module/view/promotion_detail_view.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
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
      body: Background(
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
                Expanded(
                  child: SizedBox(
                    height: 28.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CardButton(
                            label: 'Furniture',
                            hasShadow: true,
                            margin: EdgeInsets.only(right: 14.w),
                          );
                        }),
                  ),
                ),
              ],
            ),
            Gap(16.h),
            Expanded(
              child: ListView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OnTapFade(
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushNamed(PromotionDetailView.route);
                        Get.toNamed(PromotionDetailView.route);
                      },
                      child: ProductCard(
                        promoText: '15% Discount Available On',
                        productText: 'Fresh Basket Of Pear',
                        productDescription:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing  aliquet molestie. Id amet at sit fringilla turpis blandit eu sagit.',
                        image: Assets.pearImage,
                        oldPrice: '35',
                        newPrice: '27',
                        margin: EdgeInsets.only(bottom: 20.h),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
