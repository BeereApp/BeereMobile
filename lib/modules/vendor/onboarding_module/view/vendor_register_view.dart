import 'package:beere_mobile/modules/dashboard_module/view/dashboard_view.dart';
import 'package:beere_mobile/modules/vendor/onboarding_module/controller/vendor_register_controller.dart';
import 'package:beere_mobile/modules/vendor/onboarding_module/view/custom_widgets.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/drop_down_widget.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VendorRegisterView extends StatelessWidget {
  static const String route = '/vendor_register_view';

  final VendorRegisterArguments args;

  const VendorRegisterView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return GetX<VendorRegisterController>(
      init: VendorRegisterController(args),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          if (controller.currentStep > 2 && controller.currentStep < 5) {
            controller.previousStep();
            return Future.value(false);
          }
          if (controller.currentStep == 2) {
            //Todo: Show Dialog confirming exit
            return Future.value(false);
          }
          if (controller.currentStep == 5) {
            //Todo: Show Dialog confirming exit
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: Scaffold(
          appBar: customAppbar(
            context,
            actions: [
              SecondaryButton(
                onPressed: () => Get.back(),
                isCenter: true,
                text: 'Already have an account',
                textColor: kPrimaryYellow,
              ),
              Gap(16.w),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Background(
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
                Gap(20.h),
                const StepperWidget(),
                Gap(12.h),
                if (controller.currentStep == 1) _vendorInfo(controller),
                if (controller.currentStep == 2) _businessInfo(controller),
                if (controller.currentStep == 3) _bankInfo(controller),
                if (controller.currentStep == 4) _summaryInfo(controller),
                if (controller.currentStep == 5) _successPage(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _vendorInfo(VendorRegisterController controller) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKeys[0],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                'Add Vendor\'s Account Information',
                color: kPrimaryBlue,
                fontSize: 12.sp,
                fontStyle: FontStyle.poppins,
              ),
              Gap(12.h),
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
                validator: (value) => value == null || !GetUtils.isEmail(value)
                    ? 'Enter a valid email address'
                    : null,
              ),
              Gap(12.h),
              InputWidget(
                onChanged: (value) => controller.phone = value,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                ],
                hintText: 'Phone Number',
                validator: (value) => (value == null ||
                        value.length != 11 ||
                        !value.isNumericOnly)
                    ? 'Enter a valid phone number'
                    : null,
                keyBoardType: TextInputType.phone,
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
              DropDownMenuWidget(
                value: controller.userType,
                label: 'Are you an Individual, Business Entity or Company?',
                hint: 'Choose',
                itemList: const [
                  'Individual',
                  'Business Entity',
                  'Company',
                ],
                isDense: true,
                onChanged: (value) {
                  controller.userType = value;
                },
              ),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.termsCheckBox,
                      onChanged: (value) => controller.termsCheckBox = value!,
                      side: const BorderSide(color: kLightGray, width: 0.5),
                      fillColor: MaterialStateProperty.all(kPrimaryBlue),
                    ),
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
              Gap(20.h),
              PrimaryButton(
                onPressed: () => controller.register(),
                enabled: controller.enabled1,
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
    );
  }

  Widget _businessInfo(VendorRegisterController controller) {
    //To ensure that after the controller scroll when the widget is first gotten
    //it doesn't scroll again
    bool scroll = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scroll) {
        controller.businessScrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        scroll = true;
      }
    });
    return Expanded(
      child: SingleChildScrollView(
        controller: controller.businessScrollController,
        child: Form(
          key: controller.formKeys[1],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                'Add Business Information',
                color: kPrimaryBlue,
                fontSize: 12.sp,
                fontStyle: FontStyle.poppins,
              ),
              Gap(12.h),
              InputWidget(
                onChanged: (value) => controller.companyRegisteredName = value,
                hintText: 'Company Registered Name',
                validator: (value) => (value == null || value.length < 3)
                    ? 'Name should be at least 3 characters'
                    : null,
              ),
              Gap(12.h),
              InputWidget(
                onChanged: (value) => controller.companyAddress = value,
                hintText: 'Company Address',
                validator: (value) => (value == null || value.isEmpty)
                    ? 'This field is required'
                    : null,
              ),
              Gap(12.h),
              InputWidget(
                onChanged: (value) => controller.companyPhone = value,
                hintText: 'Company Phone',
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                ],
                validator: (value) => (value == null ||
                        value.length != 11 ||
                        !value.isNumericOnly)
                    ? 'Enter a valid phone number'
                    : null,
                keyBoardType: TextInputType.phone,
              ),
              Gap(12.h),
              InputWidget(
                onChanged: (value) => controller.tin = value,
                hintText: 'Tax Identification Number (TIN)',
              ),
              Gap(12.h),
              InputWidget(
                onChanged: (value) => controller.cacNumber = value,
                hintText: 'CAC Registration Number',
              ),
              Gap(16.h),
              controller.isGettingCategories
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.categoryList.isEmpty
                      ? const SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 30.r,
                                backgroundColor: kWhite,
                                child: Center(
                                  child: SvgPicture.asset(
                                    Assets.shoppingBagIcon,
                                    height: 26.r,
                                    width: 26.r,
                                  ),
                                ),
                              ),
                            ),
                            Gap(12.h),
                            Center(
                              child: MyText(
                                'Select category to help improve results for customer',
                                color: kBlack.withOpacity(0.61),
                                fontSize: 12.sp,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Gap(12.h),
                            Card(
                              color: kWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              elevation: 3,
                              child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 16.w),
                                child: Wrap(
                                  children: [
                                    for (int i = 0;
                                        i <
                                            controller
                                                .selectedCategoryList.length;
                                        i++)
                                      CategoryBox(
                                        controller.selectedCategoryList[i],
                                        textColor: kBlack,
                                        fontSize: 12.sp,
                                        rightMargin: 5.w,
                                        bottomMargin: 4.h,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Gap(24.h),
                            Wrap(
                              children: [
                                for (int i = 0;
                                    i < controller.categoryList.length;
                                    i++)
                                  OnTapFade(
                                    onTap: () {
                                      if (controller.selectedCategoryList
                                          .contains(
                                              controller.categoryList[i])) {
                                        controller.selectedCategoryList
                                            .remove(controller.categoryList[i]);
                                      } else {
                                        controller.selectedCategoryList
                                            .add(controller.categoryList[i]);
                                      }
                                    },
                                    child: CategoryBox(
                                      controller.categoryList[i],
                                      textColor: controller.selectedCategoryList
                                              .contains(
                                                  controller.categoryList[i])
                                          ? kPrimaryBlue
                                          : null,
                                    ),
                                  )
                              ],
                            ),
                            Gap(24.h),
                          ],
                        ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.isManufacturer,
                      onChanged: (value) => controller.isManufacturer = value!,
                      side: const BorderSide(color: kLightGray, width: 0.5),
                      fillColor: MaterialStateProperty.all(kPrimaryBlue),
                    ),
                  ),
                  Gap(8.w),
                  RichText(
                    text: TextSpan(
                      text: 'Are you a ',
                      style: kStyleInter.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: 'Manufacturer ',
                          style: kStyleInter.copyWith(
                              fontSize: 14.sp,
                              color: kPrimaryYellow,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: '?',
                          style: kStyleInter.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    softWrap: true,
                  ),
                ],
              ),
              Gap(24.h),
              Row(
                children: [
                  // Expanded(
                  //   child: PrimaryButton(
                  //     onPressed: () {
                  //       controller.currentStep++;
                  //     },
                  //     text: 'Skip',
                  //     textColor: kPrimaryBlue,
                  //     backgroundColor: kWhite,
                  //     borderColor: kPrimaryBlue,
                  //     hasOuterPadding: false,
                  //   ),
                  // ),
                  // Gap(16.w),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () => controller.nextStep(),
                      text: 'Continue',
                      //hasOuterPadding: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bankInfo(VendorRegisterController controller) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Form(
                key: controller.formKeys[2],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      'Add Bank Account Information',
                      color: kPrimaryBlue,
                      fontSize: 12.sp,
                      fontStyle: FontStyle.poppins,
                    ),
                    Gap(12.h),
                    InputWidget(
                      onChanged: (value) => controller.accountName = value,
                      hintText: 'Account Name',
                      keyBoardType: TextInputType.name,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'This field is required'
                          : null,
                    ),
                    Gap(12.h),
                    InputWidget(
                      onChanged: (value) => controller.accountNumber = value,
                      hintText: 'Account Number',
                      keyBoardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                      ],
                      validator: (value) => (value == null ||
                              value.length != 10 ||
                              !value.isNumericOnly)
                          ? 'Enter a valid account number'
                          : null,
                    ),
                    Gap(12.h),
                    InputWidget(
                      onChanged: (value) => controller.bankName = value,
                      hintText: 'Bank Name',
                      keyBoardType: TextInputType.text,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'This field is required'
                          : null,
                    ),
                    Gap(24.h),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () => controller.previousStep(),
                            text: 'Back',
                            textColor: kPrimaryBlue,
                            backgroundColor: kWhite,
                            borderColor: kPrimaryBlue,
                            hasOuterPadding: false,
                          ),
                        ),
                        Gap(16.w),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () => controller.nextStep(),
                            text: 'Continue',
                            hasOuterPadding: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _summaryInfo(VendorRegisterController controller) {
    return Expanded(
      child: Form(
        key: controller.formKeys[3],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              'Summary',
              color: kPrimaryBlue,
              fontSize: 12.sp,
              fontStyle: FontStyle.poppins,
            ),
            Gap(12.h),
            InputWidget(
              controller: controller.sellerIdController,
              hintText: 'Seller ID',
              readOnly: true,
              textAlign: TextAlign.center,
              keyBoardType: TextInputType.text,
            ),
            Gap(100.h),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onPressed: () => controller.previousStep(),
                    text: 'Back',
                    textColor: kPrimaryBlue,
                    backgroundColor: kWhite,
                    borderColor: kPrimaryBlue,
                    hasOuterPadding: false,
                  ),
                ),
                Gap(16.w),
                Expanded(
                  child: PrimaryButton(
                    onPressed: () => controller.updateInfo(),
                    hasOuterPadding: false,
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
                              'Complete',
                              fontStyle: FontStyle.poppins,
                              textAlign: TextAlign.center,
                              color: kWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                              letterSpacing: 1.sp,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _successPage(VendorRegisterController controller) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            color: kPrimaryBlue.withOpacity(0.2),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: MyText(
              'Account information was updated and will be reviewed shortly.',
              color: kPrimaryBlue,
              fontSize: 10.sp,
              letterSpacing: -0.02.sp,
              textAlign: TextAlign.center,
            ),
          ),
          Gap(30.h),
          Card(
            color: kWhite,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
              child: Column(
                children: [
                  SvgPicture.asset(
                    Assets.successCheckIcon,
                    width: 148.r,
                    height: 148.r,
                  ),
                  Gap(24.h),
                  MyText(
                    'You successfully completed your registration as a vendor, you can start trading on the beere App',
                    fontStyle: FontStyle.poppins,
                    fontSize: 14.02.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          PrimaryButton(
            onPressed: () => Get.offAllNamed(DashboardView.route),
            text: 'GO TO HOME',
          ),
        ],
      ),
    );
  }
}
