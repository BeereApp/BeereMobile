import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/rating_bar.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FavouriteView extends StatelessWidget {
  static const String route = '/favourite_view';
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, titleText: 'Settings', centerTitle: false),
      body: Background(
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h, bottom: 10.h),
        child: Column(
          children: [
            Card(
              elevation: 4,
              color: kWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r)),
              shadowColor: kPrimaryBlue,
              child: Container(
                height: 100.h,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          image: const DecorationImage(
                              image: AssetImage(Assets.vendorProfileBGImage),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    Gap(8.w),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            'Domino\'s Pizza',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.poppins,
                          ),
                          MyText(
                            'Lekki VI, Lagos',
                            height: 1,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.poppins,
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: RatingBar(
                              rating: 4,
                              size: 10.r,
                              padding: EdgeInsets.symmetric(horizontal: 2.r),
                            ),
                          ),
                          Gap(6.h),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: MyText(
                              '(2.5k ratings)',
                              height: 1,
                              color: kBlack,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.poppins,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
