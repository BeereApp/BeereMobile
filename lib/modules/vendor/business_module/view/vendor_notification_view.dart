import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/switch_button.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class VendorNotificationView extends StatelessWidget {
  static const String route = '/vendor_notification_view';
  const VendorNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppbar(context, titleText: 'Notification', centerTitle: false),
      extendBodyBehindAppBar: true,
      body: Background(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        child: Column(
          children: [
            if (usertype == UserType.vendor)
              SwitchButton(
                text1: 'Inbox',
                text2: 'Orders',
                onOnePressed: () {},
                onTwoPressed: () {},
              ),
            if (usertype == UserType.vendor) Gap(12.h),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return _notificationWidget(
                    title: 'Men\'s printed T-shirt',
                    title2: "on product of the week",
                    text: 'Order No: t98t7u3487897',
                    time: '3:00PM',
                    verified: true,
                    read: true,
                    isOrder: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationWidget(
      {required String title,
      required String title2,
      required String text,
      required String time,
      bool verified = false,
      bool isOrder = false,
      bool isDelivered = true,
      bool read = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: kStylePoppins.copyWith(
              color: kBlack,
              fontSize: 14.sp,
              // fontWeight: FontWeight.w700,
              // decoration: TextDecoration.none,
            ),
            children: [
              const TextSpan(
                  text: ' ', style: TextStyle(decoration: TextDecoration.none)),
              TextSpan(
                text: title2,
                style: kStylePoppins.copyWith(
                    fontSize: 12.sp,
                    ),
              ),
            ],
          ),
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
          children: [
            if (!isOrder)
              CardButton(
                label: isDelivered ? 'Delivered' : 'Canceled',
                color: isDelivered ? kPrimaryGreen : kPrimaryRed,
                textColor: kWhite,
                alignToCenter: false,
                borderRadius: 16.r,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
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
            )
          ],
        ),
        Gap(16.h),
      ],
    );
  }
}
