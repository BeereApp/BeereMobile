import 'package:beere_mobile/modules/vendor/business_module/controller/vendor_promotion_controller.dart';
import 'package:beere_mobile/utils/app_colors.dart';
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
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'custom_widgets.dart';

class VendorAddPromotionView extends StatelessWidget {
  static const String route = '/vendor_add_promotion_view';

  const VendorAddPromotionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<VendorPromotionController>(
      builder: (controller) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: customAppbar(context,
              titleText: 'Add Promotion',
              centerTitle: false,
              backgroundColor: kWhite,
              elevation: 1),
          body: Background(
            padding: EdgeInsets.zero,
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Gap(10.h),
                    MyText(
                      'Upload Product Image',
                      color: kPrimaryBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                    Gap(12.h),
                    Divider(
                      color: kPrimaryBlue,
                      height: 1.h,
                      thickness: 0.5,
                    ),
                    Gap(8.h),
                    SizedBox(
                      height: controller.image == null
                          ? MediaQuery.of(context).size.height * 0.15
                          : MediaQuery.of(context).size.height * 0.2,
                      child: controller.image != null
                          ? OnTapFade(
                              onTap: () => controller.selectImage(context),
                              child: Container(
                                decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: FileImage(controller.image!),
                                        fit: BoxFit.contain)),
                              ),
                            )
                          : UnconstrainedBox(
                              child: OnTapFade(
                                onTap: () => controller.selectImage(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 3.h,
                                      left: 4.w,
                                      right: 8.w,
                                      bottom: 3.h),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: kLightGray,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 2.h),
                                        child: MyText(
                                          'Choose File',
                                          textAlign: TextAlign.center,
                                          fontSize: 14.sp,
                                          fontStyle: FontStyle.poppins,
                                          color: kWhite,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Gap(8.w),
                                      MyText(
                                        'No File Chosen',
                                        textAlign: TextAlign.center,
                                        fontSize: 14.sp,
                                        fontStyle: FontStyle.poppins,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Gap(16.h),
                    MyText(
                      'Other Details',
                      color: kPrimaryBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                    Gap(12.h),
                    Divider(
                      color: kPrimaryBlue,
                      height: 1.h,
                      thickness: 0.5,
                    ),
                    Gap(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputWidget(
                            onChanged: (value) =>
                                controller.productName = value,
                            hintText: 'Name of Product/Event',
                            fillColor: kWhite,
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'This field is required'
                                    : null,
                          ),
                          Gap(12.h),
                          InputWidget(
                            onChanged: (value) =>
                                controller.productType = value,
                            hintText: 'Product Type',
                            fillColor: kWhite,
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'This field is required'
                                    : null,
                          ),
                          Gap(12.h),
                          DropDownMenuWidget(
                            value: controller.category,
                            itemList: controller.categoryList,
                            onChanged: (value) => controller.category = value,
                            label: 'Category',
                            hint: 'Choose category',
                            isDense: true,
                            fillColor: kWhite,
                          ),
                          Gap(12.h),
                          InputWidget(
                            onChanged: (value) => controller.location = value,
                            hintText: 'Location',
                            fillColor: kWhite,
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'This field is required'
                                    : null,
                          ),
                          Gap(12.h),
                          InputWidget(
                            onChanged: (value) => controller.price = value,
                            hintText: 'Enter Amount',
                            keyBoardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            label: 'Price',
                            fillColor: kWhite,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d{0,2}')),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9.]")),
                              TextInputFormatter.withFunction(
                                (oldValue, newValue) => newValue.text.isEmpty
                                    ? newValue
                                    : double.tryParse(newValue.text) != null
                                        ? newValue
                                        : oldValue,
                              ),
                            ],
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'This field is required'
                                    : null,
                          ),
                          Gap(12.h),
                          InputWidget(
                            onChanged: (value) => controller.discount = value,
                            hintText: 'Enter value between 0 - 100',
                            label: 'Discount percentage % (offers)',
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d{0,2}')),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9.]")),
                              TextInputFormatter.withFunction(
                                (oldValue, newValue) => newValue.text.isEmpty
                                    ? newValue
                                    : double.tryParse(newValue.text) != null
                                        ? newValue
                                        : oldValue,
                              ),
                            ],
                            keyBoardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: (value) => (value != null &&
                                    value.isNotEmpty &&
                                    ((double.tryParse(value) ?? 0) > 100))
                                ? 'Value cannot exceed the range 0 - 100'
                                : null,
                            fillColor: kWhite,
                          ),
                          Gap(12.h),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 14.sp,
                                letterSpacing: -0.02.sp,
                                color: kTextGray,
                                height: (22 / 14).sp),
                          ),
                          Gap(4.h),
                          SizedBox(
                            height: 160.h,
                            child: MultiLineInputWidget(
                              onChanged: (value) =>
                                  controller.description = value,
                              hintText: 'Enter Description of product',
                              multiLine: true,
                              keyBoardType: TextInputType.multiline,
                              fillColor: kWhite,
                              validator: (value) =>
                                  (value == null || value.isEmpty)
                                      ? 'This field is required'
                                      : null,
                            ),
                          ),
                          Gap(12.h),
                          Text(
                            'Promotion Duration',
                            style: TextStyle(
                                fontSize: 14.sp,
                                letterSpacing: -0.02.sp,
                                color: kTextGray,
                                height: (22 / 14).sp),
                          ),
                          Gap(4.h),
                          const DurationWidget(),
                          Gap(30.h),
                          PrimaryButton(
                            onPressed: () => controller.addPromotion(),
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
                                      'Add Promotion',
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
