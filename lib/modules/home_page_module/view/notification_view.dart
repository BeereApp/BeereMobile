import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class NotificationView extends StatelessWidget {
  static const String route = '/notification_view';
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppbar(context, titleText: 'Notification', centerTitle: false),
      body: Background(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return _notificationWidget(
                    title: 'Beere',
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet morbi tincidunt elit nunc. Ultricies nam sit pharetra, fringilla aliquet.',
                    time: '3:00PM',
                    verified: true,
                    read: true,
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
      required String text,
      required String time,
      bool verified = false,
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
          ],
        ),
        Gap(4.h),
        MyText(
          text,
          fontSize: 12.sp,
          fontStyle: FontStyle.poppins,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        Gap(4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
