import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/drop_down_widget.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VendorEditBusinessView extends StatelessWidget {
  static const String route = '/vendor_edit_business_view';

  const VendorEditBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context,
          titleText: 'Verify Business',
          centerTitle: false,
          backgroundColor: kWhite,
          elevation: 1),
      body: Background(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(25.h),
              MyText(
                'Input your information',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: kBlack,
                fontStyle: FontStyle.poppins,
              ),
              Gap(5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: RichText(
                  text: TextSpan(
                    text:
                        'We need you to help us with some basic information for your '
                        'account verification. Here are our ',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: kTextGray,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'terms and conditions. ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint('I got called');
                          },
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: kPrimaryYellow,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Let\'s keep Beere safe.',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: kTextGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(24.h),
              const InputWidget(
                hintText: 'Full Business Name',
                keyBoardType: TextInputType.text,
              ),
              Gap(12.h),
              const InputWidget(
                hintText: 'Office Phone',
                keyBoardType: TextInputType.phone,
              ),
              Gap(12.h),
              DropDownMenuWidget(
                hint: 'Company Type',
                isDense: true,
                itemList: ['A'],
                onChanged: (value) {},
              ),
              Gap(12.h),
              DropDownMenuWidget(
                hint: 'Identify Document Type',
                isDense: true,
                itemList: ['A'],
                onChanged: (value) {},
              ),
              Gap(12.h),
              const InputWidget(
                hintText: 'CAC Number',
                keyBoardType: TextInputType.text,
              ),
              Gap(12.h),
              const InputWidget(
                hintText: 'Website',
                keyBoardType: TextInputType.text,
              ),
              Gap(30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    side: const BorderSide(color: kLightGray, width: 0.5),
                    fillColor: MaterialStateProperty.all(kPrimaryBlue),
                  ),
                  Gap(8.w),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: kStyleInter.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms and Conditions.',
                            style: kStyleInter.copyWith(
                                fontSize: 14.sp,
                                color: kPrimaryYellow,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Gap(24.h),
              PrimaryButton(
                onPressed: () {},
                text: 'Submit',
              ),
              Gap(25.h),
            ],
          ),
        ),
      ),
    );
  }
}
