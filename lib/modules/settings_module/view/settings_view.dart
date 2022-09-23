import 'package:beere_mobile/modules/onboarding_module/view/change_password_view.dart';
import 'package:beere_mobile/modules/settings_module/view/about_view.dart';
import 'package:beere_mobile/modules/settings_module/view/favourite_view.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/dialog.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  static const String route = '/settings_view';

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context,
          hasLeading: false, titleText: 'Settings', centerTitle: false),
      body: Background(
        child: Column(
          children: [
            _settingsWidget(
              'Notifications',
              onPressed: () {},
              child: MyText(
                'ON',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.poppins,
                color: kPrimaryBlue,
              ),
            ),
            _settingsWidget(
              'Favourite',
              onPressed: () {
                Get.toNamed(FavouriteView.route);
              },
              child: RotatedBox(
                quarterTurns: 135,
                child: SvgPicture.asset(
                  Assets.downArrow,
                  width: 16.w,
                  height: 8.h,
                ),
              ),
            ),
            _settingsWidget('Terms & Conditions', onPressed: () {}),
            _settingsWidget('FAQ', onPressed: () {}),
            _settingsWidget('Privacy Policy', onPressed: () {}),
            _settingsWidget('About', onPressed: () {
              Get.toNamed(AboutView.route);
            }),
            _settingsWidget('Change password', onPressed: () {
              Get.toNamed(ChangePasswordView.route);
            }),
            _settingsWidget('Log Out', onPressed: () {
              MyDialog.showInfo(
                'Are you sure you want to log out?',
                onYesTap: () {},
                onNoTap: () {
                  Get.back();
                },
              );
            },
                child: SvgPicture.asset(
                  Assets.logoutIcon,
                  width: 25.r,
                  height: 25.r,
                )),
          ],
        ),
      ),
    );
  }

  Widget _settingsWidget(String label,
      {required VoidCallback onPressed, Widget? child}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0.h),
      child: OnTapFade(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              label,
              fontSize: 16,
              fontStyle: FontStyle.poppins,
              color: kBlack,
            ),
            child ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
