import 'package:beere_mobile/modules/vendor/business_module/view/vendor_edit_business_view.dart';
import 'package:beere_mobile/modules/vendor/profile_module/controller/vendor_profile_controller.dart';
import 'package:beere_mobile/modules/vendor/profile_module/view/vendor_location_view.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VendorProfileView extends StatelessWidget {
  static const String route = '/vendor_profile_view';

  const VendorProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<VendorProfileController>(
      init: VendorProfileController(),
      builder: (controller) => Scaffold(
        appBar: customAppbar(context,
            hasLeading: false,
            titleText: 'Profile',
            centerTitle: false,
            titleColor: kWhite),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                color: kPrimaryBlue,
              ),
            ),
            Background(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(color: kPrimaryBlue),
                    child: Row(
                      children: [
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50.r,
                                backgroundColor: kWhite,
                                child: CircleAvatar(
                                  radius: 49.r,
                                  child: Image.asset(
                                    Assets.vendorProfileAvatar,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Gap(8.h),
                              MyText(
                                'Aleke Joshua',
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                color: kWhite,
                              ),
                              Gap(20.h),
                            ],
                          ),
                        ),
                        Expanded(
                          child: OnTapFade(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.cameraIcon,
                                  width: 32.w,
                                  height: 26.h,
                                ),
                                Gap(4.h),
                                MyText(
                                  'Edit Image',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: kWhite,
                                  fontStyle: FontStyle.poppins,
                                ),
                                Gap(40.h),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 25.w, right: 25.w, top: 40.h, bottom: 20.h),
                        child: controller.isProcessing
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryBlue,
                                ),
                              )
                            : controller.index == 0
                                ? _personalInfoWidget()
                                : _businessInfoWidget(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height * 0.21,
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: OnTapFade(
                          onTap: () => controller.index = 0,
                          child: Column(
                            children: [
                              Gap(16.h),
                              MyText(
                                'Personal Info',
                                fontStyle: FontStyle.poppins,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: controller.index == 0 ? kBlack : null,
                              ),
                              Gap(16.h),
                              Divider(
                                height: 2.h,
                                color: controller.index == 0
                                    ? kPrimaryBlue
                                    : Colors.transparent,
                                thickness: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: OnTapFade(
                          onTap: () => controller.index = 1,
                          child: Column(
                            children: [
                              Gap(16.h),
                              MyText(
                                'Business Info',
                                fontStyle: FontStyle.poppins,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: controller.index == 1 ? kBlack : null,
                              ),
                              Gap(16.h),
                              Divider(
                                height: 2.h,
                                color: controller.index == 1
                                    ? kPrimaryBlue
                                    : Colors.transparent,
                                thickness: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _personalInfoWidget() {
    final controller = Get.find<VendorProfileController>();
    final model = controller.model;
    return Column(
      children: [
        if (!controller.editPersonalInfo)
          _profileDetails(
            'Name',
            '${model?.firstname ?? ''} ${model?.lastname ?? ''}',
            hasEdit: true,
            onEdit: () => controller.editPersonalInfo = true,
          ),
        if (controller.editPersonalInfo)
          InputWidget(
            initialValue: controller.firstName,
            onChanged: (value) => controller.firstName = value,
            hintText: 'First Name',
            keyBoardType: TextInputType.name,
            validator: (value) => (value == null || value.length < 3)
                ? 'First Name should be at least 3 characters'
                : null,
          ),
        if (controller.editPersonalInfo) Gap(12.h),
        if (controller.editPersonalInfo)
          InputWidget(
            initialValue: controller.lastName,
            onChanged: (value) => controller.lastName = value,
            hintText: 'Last Name',
            keyBoardType: TextInputType.name,
            validator: (value) => (value == null || value.length < 3)
                ? 'Last Name should be at least 3 characters'
                : null,
          ),
        if (!controller.editPersonalInfo)
          _profileDetails('Contact info', model?.phone ?? ''),
        if (controller.editPersonalInfo) Gap(12.h),
        if (controller.editPersonalInfo)
          InputWidget(
            initialValue: controller.phone,
            onChanged: (value) => controller.phone = value,
            inputFormatters: [LengthLimitingTextInputFormatter(11)],
            hintText: 'Contact Info',
            validator: (value) => (value == null || value.length != 11)
                ? 'Enter a valid phone number'
                : null,
            keyBoardType: TextInputType.phone,
          ),
        if (!controller.editPersonalInfo)
          _profileDetails('Email info', model?.email ?? ''),
        if (controller.editPersonalInfo) Gap(12.h),
        if (controller.editPersonalInfo)
          InputWidget(
            readOnly: true,
            initialValue: model?.email ?? '',
            hintText: 'Email info',
          ),
        if (!controller.editPersonalInfo)
          _profileDetails(
              'Home address', '3A, Ikota estate, eti-osa, Lagos, NG'),
        if (controller.editPersonalInfo) Gap(12.h),
        if (controller.editPersonalInfo)
          InputWidget(
            initialValue: controller.address,
            onChanged: (value) => controller.address = value,
            hintText: 'Home Address',
          ),
        if (!controller.editPersonalInfo)
          _profileDetails('Whatsapp contact', 'No data'),
        if (controller.editPersonalInfo) Gap(12.h),
        if (controller.editPersonalInfo)
          InputWidget(
            initialValue: controller.whatsapp,
            onChanged: (value) => controller.whatsapp = value,
            hintText: 'Whatsapp Contact',
          ),
        if (controller.editPersonalInfo) Gap(30.h),
        if (controller.editPersonalInfo)
          PrimaryButton(
            onPressed: () => controller.updatePersonalInfo(),
            text: 'Update',
          ),
        Gap(30.h),
      ],
    );
  }

  Widget _businessInfoWidget() {
    final controller = Get.find<VendorProfileController>();
    final model = controller.model;
    return Column(
      children: [
        if (!controller.editBusinessInfo)
          _profileDetails(
            'Business name',
            model?.companyRegisteredName ?? '',
            hasEdit: true,
            onEdit: () => controller.editBusinessInfo = true,
          ),
        if (controller.editBusinessInfo)
          InputWidget(
            initialValue: controller.companyRegisteredName,
            onChanged: (value) => controller.companyRegisteredName = value,
            hintText: 'Business Name',
            validator: (value) => (value == null || value.length < 3)
                ? 'Name should be at least 3 characters'
                : null,
          ),
        if (!controller.editBusinessInfo)
          _profileDetails('Business contact info', model?.companyPhone ?? ''),
        if (controller.editBusinessInfo) Gap(12.h),
        if (controller.editBusinessInfo)
          InputWidget(
            initialValue: controller.companyPhone,
            onChanged: (value) => controller.companyPhone = value,
            hintText: 'Business Contact Info',
            inputFormatters: [LengthLimitingTextInputFormatter(11)],
            validator: (value) => (value == null || value.length != 11)
                ? 'Enter a valid phone number'
                : null,
            keyBoardType: TextInputType.phone,
          ),
        if (!controller.editBusinessInfo)
          _profileDetails('Date of establishment', '24 - 4 - 2009'),
        if (controller.editBusinessInfo) Gap(12.h),
        if (controller.editBusinessInfo)
          InputWidget(
            controller: controller.dateController,
            hintText: 'Date Of Establishment',
            readOnly: true,
            onTap: () => controller.chooseDate(),
          ),
        if (!controller.editBusinessInfo)
          _profileDetails('Email info', 'jtech@gmail.com'),
        if (controller.editBusinessInfo) Gap(12.h),
        if (controller.editBusinessInfo)
          InputWidget(
            initialValue: controller.companyEmail,
            onChanged: (value) => controller.companyEmail = value,
            hintText: 'Email Info',
            keyBoardType: TextInputType.emailAddress,
            validator: (value) => value != null && !GetUtils.isEmail(value)
                ? 'Enter a valid email address'
                : null,
          ),
        if (!controller.editBusinessInfo)
          _profileDetails('Office telephone', 'No data'),
        if (controller.editBusinessInfo) Gap(12.h),
        if (controller.editBusinessInfo)
          InputWidget(
            initialValue: controller.officePhone,
            onChanged: (value) => controller.officePhone = value,
            hintText: 'Office Telephone',
            inputFormatters: [LengthLimitingTextInputFormatter(11)],
            validator: (value) => (value != null && value.length != 11)
                ? 'Enter a valid phone number'
                : null,
            keyBoardType: TextInputType.phone,
          ),
        if (!controller.editBusinessInfo)
          _profileDetails('Office address', model?.companyAddress ?? ''),
        if (controller.editBusinessInfo) Gap(12.h),
        if (controller.editBusinessInfo)
          InputWidget(
            initialValue: controller.companyAddress,
            onChanged: (value) => controller.companyAddress = value,
            hintText: 'Office Address',
            validator: (value) => (value == null || value.isEmpty)
                ? 'This field is required'
                : null,
          ),
        if (!controller.editBusinessInfo)
          _profileDetails('CAC number', model?.cacNumber ?? 'No data'),
        if (controller.editBusinessInfo) Gap(12.h),
        if (controller.editBusinessInfo)
          InputWidget(
            initialValue: controller.cacNumber,
            onChanged: (value) => controller.cacNumber = value,
            hintText: 'CAC Registration Number',
          ),
        if (!controller.editBusinessInfo)
          _profileDetails('Tax identification number', model?.tin ?? 'No data'),
        if (controller.editBusinessInfo) Gap(12.h),
        if (controller.editBusinessInfo)
          InputWidget(
            initialValue: controller.tin,
            onChanged: (value) => controller.tin = value,
            hintText: 'Tax Identification Number (TIN)',
          ),
        Gap(controller.editBusinessInfo ? 30.h : 16.h),
        if (controller.editBusinessInfo)
          PrimaryButton(
            onPressed: () => controller.updateBusinessInfo(),
            text: 'Update',
          ),
        if (!controller.editBusinessInfo)
          Row(
            children: [
              Expanded(
                child: ButtonWithIcon(
                  text: 'Verify Business',
                  onTap: () {
                    Get.toNamed(VendorEditBusinessView.route);
                  },
                  icon: Icon(
                    Icons.verified_user_outlined,
                    color: kPrimaryBlue,
                    size: 26.r,
                  ),
                ),
              ),
              Gap(8.w),
              Expanded(
                child: ButtonWithIcon(
                    text: 'Add Location',
                    icon: SvgPicture.asset(
                      Assets.locationIcon,
                      width: 26.r,
                      height: 26.r,
                      color: kPrimaryBlue,
                    ),
                    onTap: () {
                      Get.toNamed(VendorLocationView.route);
                    }),
              ),
            ],
          ),
        Gap(30.h),
      ],
    );
  }

  Widget _profileDetails(
    String label,
    String text, {
    bool hasEdit = false,
    VoidCallback? onEdit,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                label,
                fontSize: 14.sp,
                color: kBlack,
              ),
              Gap(1.h),
              MyText(
                text,
                fontSize: 18.sp,
                color: kLightGray,
                fontStyle: FontStyle.poppins,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
          if (hasEdit)
            GestureDetector(
              onTap: onEdit,
              child: MyText(
                'Edit',
                fontSize: 14.sp,
                fontStyle: FontStyle.poppins,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
