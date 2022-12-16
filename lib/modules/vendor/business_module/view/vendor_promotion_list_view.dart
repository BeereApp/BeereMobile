import 'package:beere_mobile/modules/vendor/business_module/controller/vendor_promotion_controller.dart';
import 'package:beere_mobile/utils/app_assets.dart';
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

import '../../../../utils/app_colors.dart';
import 'custom_widgets.dart';
import 'vendor_add_promotion_view.dart';

class VendorPromotionListView extends StatelessWidget {
  static const String route = '/vendor_promotion_list_view';

  const VendorPromotionListView({super.key});

//Todo: Add swipe to refresh and refresh button to all list
  @override
  Widget build(BuildContext context) {
    return GetX<VendorPromotionController>(
      init: VendorPromotionController(),
      builder: (controller) {
        return Scaffold(
          appBar: customAppbar(context,
              titleText: 'Promotion List',
              centerTitle: false,
              backgroundColor: kWhite,
              hasLeading: false,
              elevation: 1,
              actions: [
                OnTapFade(
                  onTap: () {},
                  child: SvgPicture.asset(
                    Assets.threeDotsIcon,
                    height: 28.h,
                    width: 26.w,
                  ),
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
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [
                  Gap(16.h),
                  Expanded(
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
                                itemBuilder: (context, index) {
                                  return VendorPromotionCard(
                                      model: controller.promotions[index]);
                                }),
                  ),
                  Gap(24.h),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0.w),
                      child: ButtonWithIcon(
                        text: 'Add Promotion',
                        icon: Icon(
                          Icons.add,
                          color: kTextGray,
                          size: 26.r,
                        ),
                        onTap: () {
                          Get.toNamed(VendorAddPromotionView.route);
                        },
                        borderColor: kTextGray,
                        fontSize: 16.sp,
                        textColor: kTextGray,
                        color: kWhite,
                        spacing: 16.w,
                        horizontalPadding: 24.w,
                      ),
                    ),
                  ),
                  Gap(25.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
