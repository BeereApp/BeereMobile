import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  static const String route = '/profile_view';
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 20.h),
                      child: Column(
                        children: [
                          _profileDetails('Name', 'Aleke Joshua',
                              hasEdit: true),
                          _profileDetails('Contact info', '+234-7011-262-311'),
                          _profileDetails('Age range', '20 - 25'),
                          _profileDetails('Gender', 'Male'),
                          _profileDetails('Email info', 'jtech@gmail.com'),
                          _profileDetails('Home address',
                              '3A, Ikota estate, eti-osa, Lagos, NG')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileDetails(String label, String text, {bool hasEdit = false}) {
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
            OnTapFade(
              onTap: () {},
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
