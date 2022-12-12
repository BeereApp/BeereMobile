import 'package:beere_mobile/modules/onboarding_module/controller/password_controller.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/progress_bar.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatelessWidget {
  static const String route = '/change_password_view';

  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      extendBodyBehindAppBar: true,
      body: Background(
        child: LayoutBuilder(builder: (context, constraints) {
          return GetX<PasswordController>(
              init: PasswordController(),
              builder: (controller) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Form(
                        key: controller.formKey2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              'Change Password',
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w800,
                              color: kPrimaryBlue,
                              letterSpacing: -0.02.sp,
                            ),
                            Gap(6.h),
                            MyText(
                              'Input your new password in the fields below to create a new '
                              'password',
                              fontSize: 13.sp,
                              fontStyle: FontStyle.poppins,
                            ),
                            Gap(50.h),
                            InputWidget(
                              onChanged: (value) => controller.password = value,
                              hintText: 'New password',
                              obscureText: controller.passwordVisibility,
                              suffixIcon: GestureDetector(
                                onTap: () => controller.passwordVisibility =
                                    !controller.passwordVisibility,
                                child: Icon(
                                  controller.passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 24.sp,
                                  color: kLightGray,
                                ),
                              ),
                              validator: (value) => (value == null ||
                                      value.length < 6)
                                  ? 'Password should be at least 6 characters'
                                  : null,
                            ),
                            Gap(8.h),
                            //Put Password strength here
                            ProgressBar(
                              progress: controller.passwordStrength(),
                              total: 10,
                            ),
                            Gap(16.h),
                            InputWidget(
                              onChanged: (value) =>
                                  controller.confirmPassword = value,
                              hintText: 'Confirm new password',
                              obscureText: controller.confirmPasswordVisibility,
                              suffixIcon: GestureDetector(
                                onTap: () =>
                                    controller.confirmPasswordVisibility =
                                        !controller.confirmPasswordVisibility,
                                child: Icon(
                                  controller.confirmPasswordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 24.sp,
                                  color: kLightGray,
                                ),
                              ),
                              validator: (value) => (value == null ||
                                      value != controller.password)
                                  ? 'Passwords do not match'
                                  : null,
                            ),
                            Gap(50.h),
                            PrimaryButton(
                              onPressed: () => controller.resetPassword(),
                              enabled: controller.password.isNotEmpty &&
                                  controller.confirmPassword.isNotEmpty &&
                                  controller.password ==
                                      controller.confirmPassword,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                child: controller.isProcessing
                                    ? Center(
                                        child: SizedBox(
                                          height: 26.r,
                                          width: 26.r,
                                          child:
                                              const CircularProgressIndicator(
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
                            Gap(20.h),
                            const Spacer(),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Do you need help? ',
                                  style: kStyleInter.copyWith(
                                      letterSpacing: 0.25.sp,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(
                                      text: 'Customer Support',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          debugPrint('I got called');
                                        },
                                      style: kStyleInter.copyWith(
                                          letterSpacing: 0.25.sp,
                                          fontSize: 14.sp,
                                          color: kPrimaryYellow,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
