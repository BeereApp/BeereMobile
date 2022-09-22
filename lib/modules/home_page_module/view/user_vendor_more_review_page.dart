import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/review_widget.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserVendorMoreReviewView extends StatelessWidget {
  static const String route = '/user_vendor_more_review_view';

  const UserVendorMoreReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppbar(context, titleText: 'More Review', centerTitle: false),
      body: Background(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        child: Column(
          children: [
            MyText(
              'Ebeano Store',
              fontStyle: FontStyle.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: kBlack,
            ),
            Gap(24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardButton(
                    label: 'All',
                    color: kPrimaryBlue,
                    textColor: kWhite,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  ),
                  CardButton(
                    label: 'Positive',
                    color: kBorderColor,
                    //textColor: kWhite,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  ),
                  CardButton(
                    label: 'Negative',
                    color: kBorderColor,
                    //textColor: kWhite,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  ),
                ],
              ),
            ),
            Gap(12.h),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Divider(
                        color: kTextGray,
                        height: 1.h,
                        thickness: 0.5,
                      ),
                      Gap(10.h),
                      ReviewWidget(
                        name: 'Anonymous',
                        date: DateTime.now(),
                        comment:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet morbi tincidunt elit nunc. Ultricies nam sit pharetra.',
                        review: true,
                      ),
                      Gap(20.h),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
