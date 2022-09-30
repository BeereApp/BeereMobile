import 'package:beere_mobile/modules/dashboard_module/view/dashboard_view.dart';
import 'package:beere_mobile/modules/onboarding_module/controller/login_controlleriew.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  static const String route = '/login_view';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      init: LoginController(),
      builder: (controller) => Scaffold(
        appBar: customAppbar(context),
        extendBodyBehindAppBar: true,
        body: Background(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    'Account Login',
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w800,
                    color: kPrimaryBlue,
                    letterSpacing: -0.02.sp,
                  ),
                  Gap(24.h),
                  SecondaryButton(
                    onPressed: () => controller.gotoRegisterPage(),
                    text: 'create an account',
                    isCenter: false,
                  ),
                  Gap(8.h),
                  InputWidget(
                    onChanged: (value) => controller.email.value = value,
                    hintText: 'Email',
                    keyBoardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || !GetUtils.isEmail(value)
                            ? 'Enter a valid email address'
                            : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) => controller.password.value = value,
                    hintText: 'Password',
                    obscureText:
                        controller.passwordVisibility.isFalse ? true : false,
                    suffixIcon: GestureDetector(
                      onTap: () => controller.passwordVisibility.value =
                          !controller.passwordVisibility.value,
                      child: Icon(
                        controller.passwordVisibility.isFalse
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 24.sp,
                        color: kLightGray,
                      ),
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Enter a valid password'
                        : null,
                  ),
                  Visibility(
                    visible: controller.isError.value,
                    child: Gap(4.h),
                  ),
                  Visibility(
                    visible: controller.isError.value,
                    child: MyText(
                      'Error: Invalid Email or Password',
                      fontSize: 14.sp,
                      color: kPrimaryRed,
                    ),
                  ),
                  Gap(16.h),
                  SecondaryButton(
                    onPressed: () => controller.forgotPassword(),
                    isCenter: true,
                    text: 'Forgot Password',
                    textColor: kPrimaryYellow,
                  ),
                  Gap(25.h),
                  PrimaryButton(
                    onPressed: () => controller.login(),
                    enabled: controller.email.isNotEmpty &&
                        controller.password.isNotEmpty,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: controller.isProcessing.isTrue
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
                              'LOGIN',
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
                  Center(
                    child: MyText(
                      'or login with',
                      fontStyle: FontStyle.poppins,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF333336),
                    ),
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OnTapFade(
                        onTap: () {
                          Get.toNamed(DashboardView.route);
                        },
                        child: SvgPicture.asset(
                          Assets.googleIcon,
                          width: 45.r,
                          height: 45.r,
                        ),
                      ),
                      Gap(16.w),
                      OnTapFade(
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.faceBookIcon,
                          width: 45.r,
                          height: 45.r,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
