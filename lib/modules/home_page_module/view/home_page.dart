import 'package:beere_mobile/modules/dashboard_module/controller/dashboard_controller.dart';
import 'package:beere_mobile/modules/home_page_module/controller/home_page_controller.dart';
import 'package:beere_mobile/modules/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/modules/home_page_module/view/notification_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/product_details_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/promotion_detail_view.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home_page';

  HomePage({super.key});
  final firstIndex = 0.obs;
  final secondIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) => Scaffold(
        body: Background(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        'Welcome,',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.02.sp,
                        fontStyle: FontStyle.poppins,
                      ),
                      MyText(
                        'Samson,',
                        fontSize: 14.sp,
                        letterSpacing: -0.02.sp,
                        fontStyle: FontStyle.poppins,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: OnTapFade(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushNamed(NotificationView.route);
                            Get.toNamed(NotificationView.route);
                          },
                          child: SvgPicture.asset(
                            Assets.notificationActiveIcon,
                            height: 28.r,
                            width: 28.r,
                          ),
                        ),
                      ),
                      OnTapFade(
                        onTap: () {
                          final dashboard = Get.find<DashboardController>();
                          dashboard.tabController.jumpToTab(1);
                          dashboard.selectedIndex = 1;
                        },
                        child: CircleAvatar(
                          radius: 16.r,
                          backgroundImage: const AssetImage(Assets.avatarImage),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Gap(10.h),
              InputWidget(
                label: true,
                filled: false,
                hintText: 'Search products, vendors, brands...',
                prefixIcon: SvgPicture.asset(
                  Assets.searchIcon,
                  fit: BoxFit.scaleDown,
                  width: 20.r,
                  height: 20.r,
                ),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OnTapFade(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.micIcon),
                    ),
                    Gap(4.w),
                    OnTapFade(
                      onTap: () {
                        Get.dialog(FilterDialog());
                      },
                      child: SvgPicture.asset(Assets.filterIcon),
                    ),
                    Gap(8.w),
                  ],
                ),
              ),
              Gap(16.h),
              Obx(
                () => SizedBox(
                  height: 26.h,
                  child: ReorderableListView(
                    padding: EdgeInsets.only(left: 8.w),
                    scrollDirection: Axis.horizontal,
                    onReorder: ((oldIndex, newIndex) =>
                        controller.reorder(oldIndex, newIndex)),
                    children: controller.productItem
                        .map((e) => CardButton(
                              key: ValueKey(e),
                              label: e,
                              hasShadow: true,
                              margin: EdgeInsets.only(right: 14.w),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Gap(16.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 185.h,
                        child: ListView.builder(
                            itemCount: controller.firstProduct.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return VisibilityDetector(
                                key: ValueKey(index),
                                onVisibilityChanged: (VisibilityInfo info) {
                                  double visiblePercentage =
                                      info.visibleFraction * 100;
                                  if (visiblePercentage > 60.0) {
                                    String a = info.key
                                        .toString()
                                        .replaceAll('Widget', '')
                                        .replaceAll('[<', '')
                                        .replaceAll('>]', '')
                                        .trim();
                                    firstIndex.value = int.parse(a);
                                  }
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(ProductDetailView.route);
                                  },
                                  child: ProductCard(
                                    promoText:
                                        controller.firstProduct[index].title,
                                    productText:
                                        controller.firstProduct[index].subtitle,
                                    productDescription:
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing  aliquet molestie. Id amet at sit fringilla turpis blandit eu sagit.',
                                    image:
                                        controller.firstProduct[index].imageUrl,
                                    buttonColor: kPrimaryYellow,
                                  ),
                                ),
                              );
                            }),
                      ),
                      Gap(6.h),
                      Obx(() => ListIndicator(
                          position: firstIndex.value,
                          count: controller.firstProduct.length)),
                      Gap(16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            'Promotions',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.poppins,
                            letterSpacing: 0.01.sp,
                          ),
                          OnTapFade(
                            onTap: () {
                              // Navigator.of(context)
                              //     .pushNamed(PromotionView.route);
                              controller.gotoPromotionsPage();
                            },
                            child: MyText(
                              'See All  >',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.poppins,
                            ),
                          ),
                        ],
                      ),
                      Gap(16.h),
                      SizedBox(
                        height: 185.h,
                        child: ListView.builder(
                            itemCount: controller.firstPromotion.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return VisibilityDetector(
                                key: ValueKey(index),
                                onVisibilityChanged: (VisibilityInfo info) {
                                  double visiblePercentage =
                                      info.visibleFraction * 100;
                                  if (visiblePercentage > 60.0) {
                                    String a = info.key
                                        .toString()
                                        .replaceAll('Widget', '')
                                        .replaceAll('[<', '')
                                        .replaceAll('>]', '')
                                        .trim();
                                    secondIndex.value = int.parse(a);
                                  }
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(PromotionDetailView.route);
                                  },
                                  child: ProductCard(
                                    promoText: '15% Discount Available On',
                                    productText: controller
                                        .firstPromotion[index].subtitle,
                                    productDescription:
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing  aliquet molestie. Id amet at sit fringilla turpis blandit eu sagit.',
                                    image: Assets.pearImage,
                                    oldPrice: '35',
                                    newPrice: '27',
                                  ),
                                ),
                              );
                            }),
                      ),
                      Gap(6.h),
                      Obx(() => ListIndicator(
                          position: secondIndex.value,
                          count: controller.firstPromotion.length)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
