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

class VendorRequestView extends StatelessWidget {
  static const String route = '/vendor_request_view';

  const VendorRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, titleText: 'Request', centerTitle: false),
      extendBodyBehindAppBar: true,
      body: Background(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: kDisabledGray,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: MyText(
                    'May 7',
                    fontSize: 14.sp,
                    color: kWhite,
                  ),
                ),
              ),
              Gap(30.h),
              Card(
                color: kWhite,
                elevation: 0.5,
                shadowColor: kLightGray,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
                  child: Column(
                    children: [
                      MyText(
                        'Micheal from Lekki requests for',
                        fontSize: 16.sp,
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.poppins,
                        fontWeight: FontWeight.w500,
                      ),
                      Gap(4.h),
                      MyText(
                        'Kodak 100 Camera',
                        fontSize: 18.sp,
                        textAlign: TextAlign.center,
                        color: kBlack.withOpacity(0.8),
                        fontStyle: FontStyle.poppins,
                        fontWeight: FontWeight.w700,
                      ),
                      Gap(8.h),
                      Row(
                        children: [
                          const Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: MyText(
                              'Category: Electronics',
                              fontSize: 12.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.poppins,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: MyText(
                              '3:00PM',
                              textAlign: TextAlign.right,
                              fontSize: 13.sp,
                              fontStyle: FontStyle.poppins,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Gap(16.h),
              Center(
                child: MyText(
                  'Is this product available?',
                  color: kBlack.withOpacity(0.8),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.poppins,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(20.h),
              Row(
                children: [
                  Expanded(
                    child: _iconButton(
                        color: kPrimaryGreen,
                        onTap: () {},
                        assetIcon: Assets.alertIcon),
                  ),
                  Gap(16.w),
                  Expanded(child: _textButton('No', () {})),
                  Gap(16.w),
                  Expanded(child: _textButton('Out of stock', () {})),
                ],
              ),
              Gap(20.h),
              Row(
                children: [
                  Expanded(
                    child: InputWidget(
                      onChanged: (value) {},
                      hintText: 'Price',
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                  Gap(12.w),
                  Expanded(
                    child: DropDownMenuWidget(
                        label: 'Negotiable',
                        hint: 'Choose an option',
                        isDense: true,
                        itemList: const ['Yes', 'No'],
                        onChanged: (value) {}),
                  ),
                ],
              ),
              Gap(12.h),
              DropDownMenuWidget(
                label: 'Delivery mode',
                hint: 'Choose an option',
                itemList: const ['Door delivery', 'I don\'t know'],
                isDense: true,
                onChanged: (value) {},
              ),
              Gap(12.h),
              Text(
                'Additional note (Optional)',
                style: TextStyle(
                    fontSize: 14.sp,
                    letterSpacing: -0.02.sp,
                    color: kTextGray,
                    height: (22 / 14).sp),
              ),
              Gap(4.h),
              SizedBox(
                height: 160.h,
                child: const MultiLineInputWidget(
                  hintText: '',
                  multiLine: true,
                  keyBoardType: TextInputType.multiline,
                  fillColor: kInputFillColor,
                ),
              ),
              Gap(50.h),
              PrimaryButton(
                onPressed: () {},
                text: 'SEND',
              ),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textButton(String text, VoidCallback onTap, {Color? color}) {
    return SizedBox(
      height: 50.h,
      child: CardButton(
        label: text,
        onTap: onTap,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        textColor: kTextGray.withOpacity(0.6),
        borderRadius: 8.r,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        color: color ?? Colors.transparent,
        border: Border.all(color: kLightGray),
      ),
    );
  }

  Widget _iconButton(
      {IconData? iconData,
      String? assetIcon,
      required Color color,
      required VoidCallback onTap}) {
    return SizedBox(
      height: 50.h,
      child: CardButton(
        color: kPrimaryGreen,
        borderRadius: 8.r,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: iconData != null
            ? Icon(
                iconData,
                size: 28.sp,
                color: kWhite,
              )
            : assetIcon != null
                ? SvgPicture.asset(
                    assetIcon,
                    color: kWhite,
                  )
                : const SizedBox(),
      ),
    );
  }
}
