import 'package:beere_mobile/models/place_model.dart';
import 'package:beere_mobile/modules/vendor/profile_module/controller/vendor_location_controller.dart';
import 'package:beere_mobile/utils/app_assets.dart';
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
            controller: controller.scrollController,
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
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                    ],
                    validator: (value) => (value == null ||
                            value.length != 11 ||
                            !value.isNumericOnly)
                        ? 'Enter a valid phone number'
                        : null,
                  ),
                  Gap(12.h),
                  InputWidget(
                    focusNode: controller.officeAddressNode,
                    controller: controller.officeAddressController.value,
                    onChanged: (value) async {
                      controller.officeAddress = value;
                      if (value.length > 2) {
                        await controller.autocomplete();
                        controller.scrollUp();
                      } else {
                        controller.places = null;
                      }
                    },
                    suffix: Image.asset(
                      Assets.googleImage,
                      height: 14.h,
                    ),
                    hintText: 'Store Location',
                    filled: false,
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'This field is required'
                        : null,
                  ),
                  Gap(12.h),
                  if (controller.places != null &&
                      controller.places!.predictions.isNotEmpty)
                    predictionTile(controller.places!),
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
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                    ],
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
                      onPressed: () => controller.isEdit
                          ? controller.editLocation()
                          : controller.saveLocation(),
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
                                controller.isEdit ? 'Update' : 'Save',
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

  Widget predictionTile(PlaceModel model) {
    final controller = Get.find<VendorLocationController>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    controller.setAddress(model.predictions[index].description),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.h),
                  child: MyText(
                    model.predictions[index].description,
                    fontSize: 14.sp,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Divider(
                thickness: 1.sp,
                height: 1.sp,
                color: kLightGray,
              ),
            ),
            itemCount: model.predictions.length,
            shrinkWrap: true,
          ),
          Gap(4.h),
          Image.asset(
            Assets.googleImage,
            height: 14.h,
          ),
        ],
      ),
    );
  }
}
