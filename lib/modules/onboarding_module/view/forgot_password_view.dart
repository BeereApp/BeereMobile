import 'package:beere_mobile/modules/onboarding_module/controller/password_controller.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String route = '/forgot_password_view';

  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PasswordController>(
      init: PasswordController(),
      builder: (controller) => Scaffold(
        appBar: customAppbar(context),
        extendBodyBehindAppBar: true,
        body: Background(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  'Forgot Password?',
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w800,
                  color: kPrimaryBlue,
                  letterSpacing: -0.02.sp,
                ),
                Gap(6.h),
                MyText(
                  'Please enter your email or phone number to receive an otp to '
                  'use to reset your password',
                  fontSize: 13.sp,
                  fontStyle: FontStyle.poppins,
                ),
                Gap(50.h),
                InputWidget(
                  hintText: 'Enter Email/Phone',
                  onChanged: (value) => controller.email = value,
                  keyBoardType: TextInputType.emailAddress,
                  validator: (value) => value == null || value.isEmpty
                      ? 'This field is required'
                      : null,
                ),
                Gap(50.h),
                PrimaryButton(
                  onPressed: () => controller.forgotPassword(),
                  enabled: controller.email.isNotEmpty,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: controller.isProcessing
                        ? Center(
                            child: SizedBox(
                              height: 26.r,
                              width: 26.r,
                              child: const CircularProgressIndicator(
                                color: kWhite,
                              ),
                            ),
                          )
                        : MyText(
                            'SEND',
                            fontStyle: FontStyle.poppins,
                            textAlign: TextAlign.center,
                            color: kWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            letterSpacing: 1.sp,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
