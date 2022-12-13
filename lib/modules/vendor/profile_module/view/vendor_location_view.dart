import 'package:beere_mobile/models/location_model.dart';
import 'package:beere_mobile/modules/vendor/profile_module/controller/vendor_location_controller.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/dialog.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VendorLocationView extends StatelessWidget {
  static const String route = '/vendor_location_view';

  const VendorLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<VendorLocationController>(
        init: VendorLocationController(),
        builder: (controller) {
          return Scaffold(
            appBar: customAppbar(
              context,
              titleText: 'Location',
              centerTitle: false,
            ),
            body: Background(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Expanded(
                    child: controller.isProcessing
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryBlue,
                            ),
                          )
                        : controller.locations.isEmpty
                            ? Center(
                                child: MyText(
                                  'No Location!',
                                  fontSize: 28.sp,
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.locations.length,
                                itemBuilder: (context, index) {
                                  return _locationCard(
                                      controller.locations[index]);
                                }),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.0.w),
                      child: ButtonWithIcon(
                        text: 'Add New Location',
                        icon: Icon(
                          Icons.add,
                          color: kWhite,
                          size: 26.r,
                        ),
                        onTap: () => controller.gotoAddLocation(),
                        textColor: kWhite,
                        color: kPrimaryBlue,
                        spacing: 16.w,
                        horizontalPadding: 24.w,
                      ),
                    ),
                  ),
                  Gap(16.h),
                ],
              ),
            ),
          );
        });
  }

  Widget _locationCard(LocationModel model) {
    final controller = Get.find<VendorLocationController>();
    return Card(
      elevation: 2,
      color: kWhite,
      child: Padding(
        padding: EdgeInsets.only(
            left: 26.0.w, right: 26.0.w, top: 20.h, bottom: 10.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MyText(
                        '${model.lga}, ${model.state}',
                        fontSize: 14.sp,
                        fontStyle: FontStyle.poppins,
                        color: kBlack,
                      ),
                      Gap(12.w),
                      OnTapFade(
                        onTap: () => controller.gotoEditLocation(model),
                        child: SvgPicture.asset(
                          Assets.editIcon,
                          width: 26.r,
                          height: 26.r,
                        ),
                      ),
                    ],
                  ),
                  MyText(
                    model.officeAddress,
                    fontSize: 10.sp,
                    height: (18 / 10).sp,
                    fontStyle: FontStyle.poppins,
                    color: kBlack.withOpacity(0.61),
                  ),
                  Gap(8.h),
                  MyText(
                    '${model.whatsappContact}\n${model.email}',
                    fontSize: 10.sp,
                    height: (18 / 10).sp,
                    fontStyle: FontStyle.poppins,
                    color: kBlack.withOpacity(0.61),
                  ),
                ],
              ),
            ),
            Gap(50.w),
            OnTapFade(
              onTap: () {
                MyDialog.showInfo('Change to default location',
                    onYesTap: () => controller.setDefaultLocation(model),
                    onNoTap: () => Get.back());
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: const Color(0xFFD1D1D1), width: 0.8),
                ),
                padding: EdgeInsets.all(2.r),
                child: CircleAvatar(
                  radius: 10.r,
                  backgroundColor: model.isDefault ? kPrimaryGreen : kTextGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
