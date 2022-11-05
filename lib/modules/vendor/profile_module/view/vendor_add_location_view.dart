import 'package:beere_mobile/modules/vendor/profile_module/controller/vendor_location_controller.dart';
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

class VendorAddLocationView extends StatelessWidget {
  static const String route = '/vendor_add_location_view';

  const VendorAddLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<VendorLocationController>(builder: (controller) {
      return Scaffold(
        appBar: customAppbar(context,
            titleText: 'Add New Location', centerTitle: false),
        body: Background(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  DropDownMenuWidget(
                    value: controller.state,
                    hint: 'State',
                    itemList: controller.listOfStates,
                    isDense: true,
                    fillColor: Colors.transparent,
                    onChanged: (value) {
                      //To ensure lga dropdown is reset
                      if (controller.state != value) {
                        controller.lga = null;
                      }
                      controller.state = value;
                      controller.populateLga(value);
                    },
                  ),
                  Gap(12.h),
                  DropDownMenuWidget(
                    fillColor: Colors.transparent,
                    value: controller.lga,
                    hint: 'LGA',
                    itemList: controller.listOfLgas,
                    isDense: true,
                    onChanged: (value) {
                      controller.lga = value;
                    },
                  ),
                  Gap(12.h),
                  InputWidget(
                    initialValue: controller.email,
                    onChanged: (value) => controller.email = value,
                    hintText: 'Email Info',
                    filled: false,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || !GetUtils.isEmail(value)
                            ? 'Enter a valid email address'
                            : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    initialValue: controller.whatsapp,
                    onChanged: (value) => controller.whatsapp = value,
                    hintText: 'WhatsApp contact',
                    filled: false,
                    keyBoardType: TextInputType.phone,
                    inputFormatters: [LengthLimitingTextInputFormatter(11)],
                    validator: (value) => (value == null || value.length != 11)
                        ? 'Enter a valid phone number'
                        : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    initialValue: controller.officeAddress,
                    onChanged: (value) => controller.officeAddress = value,
                    hintText: 'Office Address',
                    filled: false,
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'This field is required'
                        : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    initialValue: controller.homeAddress,
                    onChanged: (value) => controller.homeAddress = value,
                    hintText: 'Home Address',
                    filled: false,
                  ),
                  Gap(12.h),
                  InputWidget(
                    initialValue: controller.otherContact,
                    onChanged: (value) => controller.otherContact = value,
                    hintText: 'Other Contact',
                    filled: false,
                    keyBoardType: TextInputType.phone,
                    inputFormatters: [LengthLimitingTextInputFormatter(11)],
                    validator: (value) => (value != null &&
                            value.isNotEmpty &&
                            value.length != 11)
                        ? 'Enter a valid phone number'
                        : null,
                  ),
                  Gap(30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0.w),
                    child: PrimaryButton(
                      onPressed: () => controller.saveLocation(),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: controller.isProcessing
                            ? Center(
                                child: SizedBox(
                                  height: 24.r,
                                  width: 24.r,
                                  child: const CircularProgressIndicator(
                                    color: kWhite,
                                  ),
                                ),
                              )
                            : MyText(
                                'Save',
                                textAlign: TextAlign.center,
                                color: kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                      ),
                    ),
                  ),
                  Gap(24.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
