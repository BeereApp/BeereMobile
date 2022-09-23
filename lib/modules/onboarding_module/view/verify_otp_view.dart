import 'package:beere_mobile/modules/onboarding_module/controller/verify_otp_controller.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/state_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPView extends StatelessWidget {
  static const String route = '/verify_otp_view';

  const VerifyOTPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<VerifyOTPController>(
      init: VerifyOTPController(),
      builder: (controller) => Scaffold(
        appBar: customAppbar(context),
        extendBodyBehindAppBar: true,
        body: Background(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                'Enter your confirmation code',
                fontSize: 26.sp,
                fontWeight: FontWeight.w800,
                color: kPrimaryBlue,
                letterSpacing: -0.02.sp,
              ),
              Gap(24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.r),
                child: PinCodeTextField(
                  cursorColor: kPrimaryBlue,
                  cursorWidth: 1,
                  appContext: context,
                  length: 4,
                  onChanged: (String value) {
                    controller.otp = value;
                  },
                  textStyle: kStyleInter.copyWith(
                    fontSize: 26.sp,
                    color: kPrimaryBlue,
                  ),
                  backgroundColor: Colors.transparent,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    TextInputFormatter.withFunction(
                      (oldValue, newValue) => newValue.text.isEmpty
                          ? newValue
                          : int.tryParse(newValue.text) != null
                              ? newValue
                              : oldValue,
                    ),
                  ],
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10.r),
                      fieldHeight: 60.r,
                      fieldWidth: 60.r,
                      borderWidth: 0.7.r,
                      inactiveColor: kLightGray,
                      activeColor: kPrimaryBlue,
                      errorBorderColor: kPrimaryRed),
                ),
              ),
              SecondaryButton(
                onPressed: () {},
                text: 'Resend Code',
                isCenter: true,
                textColor: kPrimaryYellow,
                hasUnderline: false,
              ),
              Gap(20.h),
              PrimaryButton(
                onPressed: () {},
                enabled: controller.isOtpValid.value,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: 2 == 3
                      ? Center(
                          child: SizedBox(
                            height: 30.r,
                            width: 30.r,
                            child: const CircularProgressIndicator(
                              color: kWhite,
                            ),
                          ),
                        )
                      : MyText(
                          'VERIFY',
                          fontStyle: FontStyle.poppins,
                          textAlign: TextAlign.center,
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          letterSpacing: 1.sp,
                        ),
                ),
              ),
              Gap(25.h),
            ],
          ),
        ),
      ),
    );
  }
}
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 30.0.r),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       OtpBox(controller.firstDigit.value),
//       OtpBox(controller.secondDigit.value),
//       OtpBox(controller.thirdDigit.value),
//       OtpBox(controller.fourthDigit.value),
//     ],
//   ),
// ),
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 20.0.w),
//   child: Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           KeyboardButton(
//               mainNumber: '1',
//               onPressed: () => controller.setOtp(1)),
//           KeyboardButton(
//               mainNumber: '2',
//               onPressed: () => controller.setOtp(2)),
//           KeyboardButton(
//               mainNumber: '3',
//               onPressed: () => controller.setOtp(3)),
//         ],
//       ),
//       Gap(20.h),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           KeyboardButton(
//               mainNumber: '4',
//               onPressed: () => controller.setOtp(4)),
//           KeyboardButton(
//               mainNumber: '5',
//               onPressed: () => controller.setOtp(5)),
//           KeyboardButton(
//               mainNumber: '6',
//               onPressed: () => controller.setOtp(6)),
//         ],
//       ),
//       Gap(20.h),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           KeyboardButton(
//               mainNumber: '7',
//               onPressed: () => controller.setOtp(7)),
//           KeyboardButton(
//               mainNumber: '8',
//               onPressed: () => controller.setOtp(8)),
//           KeyboardButton(
//               mainNumber: '9',
//               onPressed: () => controller.setOtp(9)),
//         ],
//       ),
//       Gap(20.h),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           KeyboardButton(
//             onPressed: () {},
//             mainNumber: '0',
//             textColor: Colors.transparent,
//             filled: false,
//           ),
//           KeyboardButton(
//               mainNumber: '0',
//               onPressed: () => controller.setOtp(0)),
//           KeyboardButton(
//               mainNumber: '\u{232b}',
//               filled: false,
//               textFontSize: 38.sp,
//               textColor: kPrimaryBlue,
//               onPressed: () => controller.backSpace()),
//         ],
//       ),
//     ],
//   ),
// ),
