import 'package:beere_mobile/modules/vendor/settings_module/controller/vendor_statistics_controller.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/pie_chart.dart';
import 'package:beere_mobile/widgets/progress_bar.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VendorClickStatisticsView extends StatelessWidget {
  static const String route = '/vendor_click_statistics_view';

  const VendorClickStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context,
          titleText: 'Click Statistics', centerTitle: false),
      extendBodyBehindAppBar: true,
      body: Background(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    'Age Group',
                    fontStyle: FontStyle.poppins,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  PopupMenuButton<int>(
                      onSelected: (value) {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        children: [
                          MyText(
                            'This Month',
                            color: kPrimaryBlue,
                            fontSize: 12.sp,
                          ),
                          Gap(4.w),
                          SvgPicture.asset(
                            Assets.downArrowIcon,
                            color: kPrimaryBlue,
                            width: 13.w,
                            height: 7.h,
                          ),
                        ],
                      ),
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                              value: 0, child: MyText('This month')),
                        ];
                      }),
                ],
              ),
              Gap(16.h),
              Row(
                children: [
                  const PieCharts(),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _label('Below 18', Colors.blue),
                      Gap(10.h),
                      _label('18 - 34', Colors.blue),
                      Gap(10.h),
                      _label('34 - 50', Colors.blue),
                      Gap(10.h),
                      _label('51 - 69', Colors.blue),
                      Gap(10.h),
                      _label('70 - 87', Colors.blue),
                      Gap(10.h),
                      _label('Above 88', Colors.blue),
                      Gap(10.h),
                    ],
                  ),
                ],
              ),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.touchIcon,
                    width: 14.sp,
                    height: 18.sp,
                    color: kPrimaryGreen,
                  ),
                  Gap(5.w),
                  MyText(
                    '60 Clicks on Promotion',
                    fontStyle: FontStyle.poppins,
                    fontSize: 14.sp,
                    color: kTextGray.withOpacity(0.7),
                  ),
                ],
              ),
              Gap(20.h),
              MyText(
                'Cities',
                fontStyle: FontStyle.poppins,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              Gap(20.h),
              _chart(),
              Gap(20.h),
              MyText(
                'Gender',
                fontStyle: FontStyle.poppins,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              Gap(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    'Male(%)',
                    fontSize: 14.sp,
                    color: kTextGray.withOpacity(0.7),
                  ),
                  MyText(
                    'Female(%)',
                    fontSize: 14.sp,
                    color: kTextGray.withOpacity(0.7),
                  ),
                ],
              ),
              Gap(4.h),
              const ProgressBar(
                progress: 75,
                total: 100,
                hasMargin: false,
                color: Color(0xFF29CB97),
                fillColor: Color(0xFFF91414),
              ),
              Gap(4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    '75',
                    fontSize: 14.sp,
                  ),
                  MyText(
                    '25',
                    fontSize: 14.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chart() {
    final controller = Get.find<VendorStatisticsController>();
    int length = 5;
    return SizedBox(
      height: controller.getChartHeight(length),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                '0%',
                color: kTextGray.withOpacity(0.7),
                fontSize: 12.sp,
              ),
              MyText(
                '25%',
                color: kTextGray.withOpacity(0.7),
                fontSize: 12.sp,
              ),
              MyText(
                '50%',
                color: kTextGray.withOpacity(0.7),
                fontSize: 12.sp,
              ),
              MyText(
                '75%',
                color: kTextGray.withOpacity(0.7),
                fontSize: 12.sp,
              ),
              MyText(
                '100%',
                color: kTextGray.withOpacity(0.7),
                fontSize: 12.sp,
              ),
            ],
          ),
          Gap(12.h),
          Expanded(
            child: Stack(
              //fit: StackFit.expand,
              children: [
                _lines(),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: length,
                    itemBuilder: (context, index) {
                      return _progress();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _progress() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      height: 8.0.h,
      alignment: Alignment.centerLeft,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 0.4,
          child: Container(
            height: 8.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryYellow,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _lines() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: kLightGray,
          height: 0.4.sp,
          thickness: 0.4.sp,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 0.4.sp,
                color: kLightGray,
              ),
              Container(
                width: 0.4.sp,
                color: kLightGray,
              ),
              Container(
                width: 0.4.sp,
                color: kLightGray,
              ),
              Container(
                width: 0.4.sp,
                color: kLightGray,
              ),
              Container(
                width: 0.4.sp,
                color: kLightGray,
              ),
            ],
          ),
        ),
        Divider(
          color: kLightGray,
          height: 0.4.sp,
          thickness: 0.4.sp,
        ),
      ],
    );
  }

  Widget _label(String text, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MyText(
          text,
          fontSize: 14.sp,
        ),
        Gap(8.w),
        CircleAvatar(
          radius: 8.r,
          backgroundColor: color,
        ),
      ],
    );
  }
}
