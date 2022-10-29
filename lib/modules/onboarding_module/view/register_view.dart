import 'package:beere_mobile/modules/onboarding_module/controller/register_controller.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/drop_down_widget.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              key: controller.formKey,
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
                    onChanged: (value) => controller.firstName = value,
                    hintText: 'First Name',
                    keyBoardType: TextInputType.name,
                    validator: (value) => (value == null || value.length < 3)
                        ? 'First Name should be at least 3 characters'
                        : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) => controller.lastName = value,
                    hintText: 'Last Name',
                    keyBoardType: TextInputType.name,
                    validator: (value) => (value == null || value.length < 3)
                        ? 'Last Name should be at least 3 characters'
                        : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) => controller.email = value,
                    hintText: 'Email',
                    keyBoardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || !GetUtils.isEmail(value)
                            ? 'Enter a valid email address'
                            : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) => controller.phone = value,
                    inputFormatters: [LengthLimitingTextInputFormatter(11)],
                    hintText: 'Phone Number',
                    validator: (value) => (value == null || value.length != 11)
                        ? 'Enter a valid phone number'
                        : null,
                    keyBoardType: TextInputType.phone,
                  ),
                  Gap(12.h),
                  Row(
                    children: [
                      Expanded(
                        child: DropDownMenuWidget(
                          value: controller.ageRange,
                          hint: 'Age range',
                          itemList: const [
                            '18-34',
                            '35-50',
                            '51-69',
                            '70-87',
                          ],
                          onChanged: (value) =>controller.ageRange=value,
                          isDense: true,
                        ),
                      ),
                      Gap(16.w),
                      Expanded(
                        child: DropDownMenuWidget(
                          value: controller.gender,
                            hint: 'Gender',
                            isDense: true,
                            itemList: const ['Male', 'Female'],
                            onChanged: (value) =>
                        controller.gender=value
                        ),
                      ),
                    ],
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) => controller.password = value,
                    hintText: 'Password',
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
                    validator: (value) => (value == null || value.length < 6)
                        ? 'Password should be at least 6 characters'
                        : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    onChanged: (value) => controller.confirmPassword = value,
                    hintText: 'Confirm Password',
                    obscureText: controller.confirmPasswordVisibility,
                    suffixIcon: GestureDetector(
                      onTap: () => controller.confirmPasswordVisibility =
                      !controller.confirmPasswordVisibility,
                      child: Icon(
                        controller.confirmPasswordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 24.sp,
                        color: kLightGray,
                      ),
                    ),
                    validator: (value) =>
                    (value == null || value != controller.password)
                        ? 'Passwords do not match'
                        : null,
                  ),
                  Gap(12.h),
                  SecondaryButton(
                    onPressed: () => Get.back(),
                    isCenter: true,
                    text: 'Already have an account',
                    textColor: kPrimaryYellow,
                  ),
                  Gap(20.h),
                  PrimaryButton(
                    onPressed: ()=>controller.register(),
                     enabled: controller.enabled,
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
