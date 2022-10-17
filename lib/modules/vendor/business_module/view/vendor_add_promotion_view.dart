import 'package:beere_mobile/modules/vendor/business_module/controller/vendor_add_promotion_controller.dart';
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

import 'custom_widgets.dart';

class VendorAddPromotionView extends StatelessWidget {
  static const String route = '/vendor_add_promotion_view';
  const VendorAddPromotionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorAddPromotionController>(
      init: VendorAddPromotionController(),
      builder: (controller) => Scaffold(
        appBar: customAppbar(context,
            titleText: 'Add Promotion',
            centerTitle: false,
            backgroundColor: kWhite,
            elevation: 1),
        body: Background(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(10.h),
                MyText(
                  'Product Image',
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
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: UnconstrainedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.only(
                          top: 3.h, left: 4.w, right: 8.w, bottom: 3.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kLightGray,
                              borderRadius: BorderRadius.circular(10.r),
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
                      const InputWidget(
                        hintText: 'Name of Product/Event',
                        fillColor: kWhite,
                      ),
                      Gap(12.h),
                      const InputWidget(
                        hintText: 'Product Type',
                        fillColor: kWhite,
                      ),
                      Gap(12.h),
                      DropDownMenuWidget(
                        itemList: [''],
                        onChanged: (value) {},
                        hint: 'Category',
                        isDense: true,
                        fillColor: kWhite,
                      ),
                      Gap(12.h),
                      const InputWidget(
                        hintText: 'Location',
                        fillColor: kWhite,
                      ),
                      Gap(12.h),
                      const InputWidget(
                        hintText: 'Enter Amount',
                        label: 'Price',
                        fillColor: kWhite,
                      ),
                      Gap(12.h),
                      const InputWidget(
                        hintText: 'Enter Amount',
                        label: 'Discount percentage (offers)',
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
                        child: const MultiLineInputWidget(
                          hintText: 'Enter Description of product',
                          multiLine: true,
                          keyBoardType: TextInputType.multiline,
                          fillColor: kWhite,
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
                        onPressed: () {},
                        text: 'Add Promotion',
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
    );
  }
}
