import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VendorAddLocationView extends StatelessWidget {
  static const String route = '/vendor_add_location_view';
  const VendorAddLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context,
          titleText: 'Add New Location', centerTitle: false),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputWidget(
                hintText: 'State',
                filled: false,
              ),
              Gap(12.h),
              InputWidget(
                hintText: 'Location ',
                filled: false,
              ),
              Gap(12.h),
              InputWidget(
                hintText: 'Email',
                filled: false,
                keyBoardType: TextInputType.emailAddress,
              ),
              Gap(12.h),
              InputWidget(
                hintText: 'WhatsApp contact',
                filled: false,
                keyBoardType: TextInputType.phone,
              ),
              Gap(12.h),
              InputWidget(
                hintText: 'Office Address',
                filled: false,
              ),
              Gap(12.h),
              InputWidget(
                hintText: 'Home Address',
                filled: false,
              ),
              Gap(12.h),
              InputWidget(
                hintText: 'Other Contact',
                filled: false,
                keyBoardType: TextInputType.phone,
              ),
              Gap(30.h),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90.0.w),
                  child: ButtonWithIcon(
                    text: 'Save',
                    icon: Icon(
                      Icons.add,
                      color: kWhite,
                      size: 26.r,
                    ),
                    onTap: () {},
                    textColor: kWhite,
                    color: kPrimaryBlue,
                    spacing: 16.w,
                    horizontalPadding: 24.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
