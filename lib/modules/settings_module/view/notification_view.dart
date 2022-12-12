import 'package:beere_mobile/modules/settings_module/controller/notification_controller.dart';
import 'package:beere_mobile/modules/vendor/settings_module/view/vendor_request_view.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/switch_button.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  static const String route = '/notification_view';

  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<NotificationController>(
      init: NotificationController(),
      builder: (controller) {
        return Scaffold(
          appBar: customAppbar(context,
              titleText: 'Notification', centerTitle: false),
          extendBodyBehindAppBar: true,
          body: Background(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            child: Column(
              children: [
                SwitchButton(
                  text1: 'Inbox',
                  text2: 'Request',
                  onOnePressed: () => controller.index = 0,
                  onTwoPressed: () => controller.index = 1,
                  hasGreenDot: true,
                ),
                Gap(controller.index == 0 ? 12.h : 16.h),
                Expanded(
                  child: controller.index == 0
                      ? ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return _inboxWidget(
                              title: 'Beere',
                              text:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet morbi tincidunt elit nunc. Ultricies nam sit pharetra, fringilla aliquet.',
                              time: '3:00PM',
                              verified: true,
                              read: false,
                              isOrder: true,
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return OnTapFade(
                              onTap: () {
                                Get.toNamed(VendorRequestView.route);
                              },
                              child: _requestWidget(
                                  title: 'Michael from Lekki requests for',
                                  item: 'Kodak 100 Camera',
                                  category: 'Electronics',
                                  time: '3:00PM'),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _inboxWidget(
      {required String title,
      required String text,
      required String time,
      bool verified = false,
      bool isOrder = false,
      bool isDelivered = true,
      bool read = false}) {
    return Column(
      children: [
        Row(
          children: [
            MyText(
              title,
              fontStyle: FontStyle.poppins,
              color: kBlack,
              fontSize: 16.sp,
            ),
            Gap(12.w),
            if (verified)
              SvgPicture.asset(
                Assets.checkIcon,
                width: 12.sp,
                height: 12.sp,
                color: kPrimaryGreen,
              ),
            const Spacer(),
            SvgPicture.asset(
              Assets.doubleCheckIcon,
              width: 16.sp,
              height: 16.sp,
              color: read ? kPrimaryBlue : kTextGray,
            ),
            Gap(4.w),
            MyText(
              time,
              fontSize: 13.sp,
            ),
          ],
        ),
        Gap(4.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MyText(
                text,
                fontSize: 12.sp,
                fontStyle: FontStyle.poppins,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Gap(12.w),
            // SvgPicture.asset(
            //   Assets.threeDotsIcon,
            //   height: 18.h,
            //   width: 18.w,
            // ),
          ],
        ),
        Gap(4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isOrder)
              CardButton(
                label: isDelivered ? 'Delivered' : 'Canceled',
                color: isDelivered ? kPrimaryGreen : kPrimaryRed,
                textColor: kWhite,
                alignToCenter: false,
                borderRadius: 16.r,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              ),
          ],
        ),
        Gap(16.h),
      ],
    );
  }

  Widget _requestWidget({
    required String title,
    required String item,
    required String category,
    required String time,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title,
          fontSize: 14.sp,
          fontStyle: FontStyle.poppins,
          fontWeight: FontWeight.w500,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Gap(2.h),
        MyText(
          item,
          fontSize: 16.sp,
          color: kBlack.withOpacity(0.8),
          fontStyle: FontStyle.poppins,
          fontWeight: FontWeight.w700,
        ),
        Gap(4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              'Category: $category',
              fontSize: 10.sp,
              fontStyle: FontStyle.poppins,
            ),
            MyText(
              time,
              fontSize: 12.sp,
              fontStyle: FontStyle.poppins,
            ),
          ],
        ),
        Gap(16.h),
      ],
    );
  }
}
