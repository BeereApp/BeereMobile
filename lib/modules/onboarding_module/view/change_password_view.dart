import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/progress_bar.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChangePasswordView extends StatelessWidget {
  static const String route = '/change_password_view';

  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      extendBodyBehindAppBar: true,
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              'Change Password',
              fontSize: 26.sp,
              fontWeight: FontWeight.w800,
              color: kPrimaryBlue,
              letterSpacing: -0.02.sp,
            ),
            Gap(6.h),
            MyText(
              'Input your new password in the fields below to create a new '
              'password',
              fontSize: 13.sp,
              fontStyle: FontStyle.poppins,
            ),
            Gap(50.h),
            const InputWidget(
              hintText: 'New Password',
            ),
            Gap(8.h),
            //Put Password strength here
            const ProgressBar(
              progress: 3,
              total: 10,
            ),
            Gap(16.h),
            const InputWidget(
              hintText: 'New Password',
            ),
            Gap(50.h),
            PrimaryButton(
              onPressed: () {},
              // enabled: controller.email.isNotEmpty &&
              //     controller.password.isNotEmpty,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: 2 == 3
                    ? Center(
                        child: SizedBox(
                          height: 30.r,
                          width: 30.r,
                          child: const CircularProgressIndicator(
                            color: kWhite,
                          ),
                        ),
                      )
                    : MyText(
                        'SEND',
                        fontStyle: FontStyle.poppins,
                        textAlign: TextAlign.center,
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        letterSpacing: 1.sp,
                      ),
              ),
            ),
            const Spacer(),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Do you need help? ',
                  style: kStyleInter.copyWith(
                      letterSpacing: 0.25.sp,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: 'Customer Support',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('I got called');
                        },
                      style: kStyleInter.copyWith(
                          letterSpacing: 0.25.sp,
                          fontSize: 14.sp,
                          color: kPrimaryYellow,
                          fontWeight: FontWeight.w600),
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
