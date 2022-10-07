import 'package:beere_mobile/modules/vendor/settings_module/controller/vendor_download_report_controller.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/drop_down_widget.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VendorDownloadReportView extends StatelessWidget {
  static const String route = '/vendor_download_report_view';
  const VendorDownloadReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<VendorDownloadReportController>(
      init: VendorDownloadReportController(),
      builder: (controller) => Scaffold(
        appBar: customAppbar(context,
            titleText: 'Download Report', centerTitle: false),
        body: Background(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropDownMenuWidget(
                itemList: ['A', 'B'],
                onChanged: (value) {},
                hint: 'Choose Report:',
                fillColor: kWhite,
                isDense: true,
              ),
              Gap(12.h),
              Container(
                alignment: Alignment.center,
                color: kPrimaryRed.withOpacity(0.1),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: MyText(
                  'Choose a time frame to generate report statement.',
                  color: kPrimaryRed,
                  fontSize: 12.sp,
                  letterSpacing: 0.25.sp,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(16.h),
              const InputWidget(
                hintText: 'DD/MM/YY',
                label: 'Start Date:',
                fillColor: kWhite,
                readOnly: true,
              ),
              Gap(12.h),
              const InputWidget(
                hintText: 'DD/MM/YY',
                label: 'End Date:',
                fillColor: kWhite,
                readOnly: true,
              ),
              Gap(12.h),
              Text(
                'Select download format',
                style: TextStyle(
                    fontSize: 14.sp,
                    letterSpacing: -0.02.sp,
                    color: kTextGray,
                    height: (22 / 14).sp),
              ),
              Gap(4.h),
              Row(
                children: [
                  Expanded(
                    child: ButtonWithIcon(
                      elevation: controller.isPdf ? 3 : 0,
                      fontSize: 11.sp,
                      text: 'PDF Format',
                      textColor:
                          controller.isPdf ? null : kBlack.withOpacity(0.3),
                      icon: Row(
                        children: [
                          SvgPicture.asset(Assets.pdfIcon,
                              height: 25.r, width: 25.r),
                          Gap(6.w),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kLightGray)),
                            padding: EdgeInsets.all(2.r),
                            child: CircleAvatar(
                                radius: 8.r,
                                backgroundColor: controller.isPdf
                                    ? kPrimaryGreen
                                    : kBlack.withOpacity(0.2)),
                          ),
                        ],
                      ),
                      onTap: () => controller.isPdf = true,
                    ),
                  ),
                  Gap(12.w),
                  Expanded(
                    child: ButtonWithIcon(
                      elevation: controller.isPdf ? 0 : 3,
                      fontSize: 11.sp,
                      text: 'Excel Format',
                      textColor:
                          controller.isPdf ? kBlack.withOpacity(0.3) : null,
                      icon: Row(
                        children: [
                          SvgPicture.asset(Assets.excelIcon,
                              height: 25.r, width: 25.r),
                          Gap(6.w),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kLightGray)),
                            padding: EdgeInsets.all(2.r),
                            child: CircleAvatar(
                                radius: 8.r,
                                backgroundColor: controller.isPdf
                                    ? kBlack.withOpacity(0.2)
                                    : kPrimaryGreen),
                          ),
                        ],
                      ),
                      onTap: () => controller.isPdf = false,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                onPressed: () {},
                text: 'Download',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
