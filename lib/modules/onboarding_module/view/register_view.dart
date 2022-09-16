import 'package:beere_mobile/modules/onboarding_module/controller/register_controller.dart';
import 'package:beere_mobile/modules/onboarding_module/view/verify_otp_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/drop_down_widget.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  static const String route = '/register_view';

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) => Scaffold(
        appBar: customAppbar(context),
        extendBodyBehindAppBar: true,
        body: Background(
          child: SingleChildScrollView(
            child: Form(
              //key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    'Register',
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w800,
                    color: kPrimaryBlue,
                    letterSpacing: -0.02.sp,
                  ),
                  Gap(30.h),
                  InputWidget(
                    onChanged: (value) => {},
                    hintText: 'First Name',
                    keyBoardType: TextInputType.name,
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) => {},
                    hintText: 'Last Name',
                    keyBoardType: TextInputType.name,
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) => {},
                    hintText: 'Email',
                    keyBoardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || !GetUtils.isEmail(value)
                            ? 'Enter a valid email address'
                            : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) => {},
                    hintText: 'Phone Number',
                    keyBoardType: TextInputType.phone,
                  ),
                  Gap(12.h),
                  Row(
                    children: [
                      Expanded(
                        child: DropDownMenuWidget(
                          hint: 'Age range',
                          itemList: const [
                            '18-34',
                            '35-50',
                            '51-69',
                            '70-87',
                          ],
                          onChanged: (value) {},
                          isDense: true,
                        ),
                      ),
                      Gap(16.w),
                      Expanded(
                        child: DropDownMenuWidget(
                            hint: 'Gender',
                            isDense: true,
                            itemList: const ['Male', 'Female'],
                            onChanged: (value) {}),
                      ),
                    ],
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) {},
                    hintText: 'Password',
                    // obscureText:
                    // controller.passwordVisibility.isFalse ? true : false,
                    // suffixIcon: GestureDetector(
                    //   onTap: () => controller.passwordVisibility.value =
                    //   !controller.passwordVisibility.value,
                    //   child: Icon(
                    //     controller.passwordVisibility.isFalse
                    //         ? Icons.visibility_off_outlined
                    //         : Icons.visibility_outlined,
                    //     size: 24.sp,
                    //     color: kLightGray,
                    //   ),
                    // ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Enter a valid password'
                        : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) {},
                    hintText: 'Confirm Password',
                    // obscureText:
                    // controller.passwordVisibility.isFalse ? true : false,
                    // suffixIcon: GestureDetector(
                    //   onTap: () => controller.passwordVisibility.value =
                    //   !controller.passwordVisibility.value,
                    //   child: Icon(
                    //     controller.passwordVisibility.isFalse
                    //         ? Icons.visibility_off_outlined
                    //         : Icons.visibility_outlined,
                    //     size: 24.sp,
                    //     color: kLightGray,
                    //   ),
                    // ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Enter a valid password'
                        : null,
                  ),
                  // Visibility(
                  //   visible: controller.isError.value,
                  //   child: Gap(4.h),
                  // ),
                  // Visibility(
                  //   visible: controller.isError.value,
                  //   child: MyText(
                  //     'Error: Invalid Email or Password',
                  //     fontSize: 14.sp,
                  //     color: kPrimaryRed,
                  //   ),
                  // ),
                  Gap(12.h),
                  SecondaryButton(
                    onPressed: () {},
                    isCenter: true,
                    text: 'Already have an account',
                    textColor: kPrimaryYellow,
                  ),
                  Gap(20.h),
                  PrimaryButton(
                    onPressed: () {
                      Get.toNamed(VerifyOTPView.route);
                    },
                    // enabled: controller.email.isNotEmpty &&
                    //     controller.password.isNotEmpty,
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
                              'REGISTER',
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
      ),
    );
  }
}
