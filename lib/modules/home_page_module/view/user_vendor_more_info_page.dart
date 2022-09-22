import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserVendorMoreInfoView extends StatelessWidget {
  static const String route = '/user_vendor_more_info_view';
  const UserVendorMoreInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, titleText: 'More Info', centerTitle: false),
      // /extendBodyBehindAppBar: true,
      body: Background(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        child: Column(
          children: [
            MyText(
              'Ebeano Store',
              fontStyle: FontStyle.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: kBlack,
            ),
            Gap(24.h),
            _infoWidget('Trades', '1695', 'times'),
            Gap(12.h),
            _infoWidget('Completion rate', '80.05%', ''),
            Gap(12.h),
            _infoWidget('Active', '30', 'mins ago'),
            Gap(12.h),
            _infoWidget('Fastest delivery period', '40', 'mins'),
            Gap(12.h),
            _infoWidget('Longest delivery period', '2', 'hrs'),
            Gap(12.h),
            _infoWidget('Positive feedback[%]', '95%', ''),
            Gap(12.h),
            _infoWidget('Registered', '416', 'days ago'),
            Gap(12.h),
            _infoWidget('First trade', '358', 'days ago'),
          ],
        ),
      ),
    );
  }

  Widget _infoWidget(String label, String value, String metric) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: MyText(
            label,
            fontStyle: FontStyle.poppins,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        Expanded(
          flex: 6,
          child: RichText(
            textAlign: TextAlign.end,
            text: TextSpan(
                text: value,
                style: kStylePoppins.copyWith(
                  color: kPrimaryBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                children: [
                  TextSpan(
                    text: metric.isEmpty ? '' : ' $metric',
                    style: kStylePoppins.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
