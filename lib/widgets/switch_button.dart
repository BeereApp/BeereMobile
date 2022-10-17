import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onOnePressed,
      required this.onTwoPressed});

  final String text1;
  final String text2;
  final Function onOnePressed;
  final Function onTwoPressed;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: BoxDecoration(
        color: kButtonColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.only(top: 1.5.h, left: 1.h, right: 1.h, bottom: 1.h),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
                widget.onOnePressed.call();
              },
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx > 1) {
                  setState(() {
                    index = 1;
                  });
                  widget.onTwoPressed.call();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index == 0 ? kWhite : null,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: MyText(
                  widget.text1,
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                  fontStyle: FontStyle.poppins,
                  color: index == 0 ? kPrimaryBlue : null,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx < 1) {
                  setState(() {
                    index = 0;
                  });
                  widget.onOnePressed.call();
                }
              },
              onTap: () {
                setState(() {
                  index = 1;
                });
                widget.onTwoPressed.call();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index == 1 ? kWhite : null,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: MyText(
                  widget.text2,
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                  fontStyle: FontStyle.poppins,
                  color: index == 1 ? kPrimaryBlue : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchThreeButton extends StatefulWidget {
  const SwitchThreeButton({
    super.key,
    required this.text1,
    required this.text2,
    required this.onOnePressed,
    required this.onTwoPressed,
    required this.text3,
    required this.onThreePressed,
  });

  final String text1;
  final String text2;
  final String text3;
  final Function onOnePressed;
  final Function onTwoPressed;
  final Function onThreePressed;

  @override
  State<SwitchThreeButton> createState() => _SwitchThreeButtonState();
}

class _SwitchThreeButtonState extends State<SwitchThreeButton> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kButtonColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.only(top: 1.5.h, left: 1.h, right: 1.h, bottom: 1.h),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
                widget.onOnePressed.call();
              },
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx > 1) {
                  setState(() {
                    index = 1;
                  });
                  widget.onTwoPressed.call();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index == 0 ? kWhite : null,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: MyText(
                  widget.text1,
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                  fontStyle: FontStyle.poppins,
                  color: index == 0 ? kPrimaryBlue : null,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx < 1) {
                  setState(() {
                    index = 0;
                  });
                  widget.onOnePressed.call();
                }
                if (details.velocity.pixelsPerSecond.dx > 1) {
                  setState(() {
                    index = 2;
                  });
                  widget.onThreePressed.call();
                }
              },
              onTap: () {
                setState(() {
                  index = 1;
                });
                widget.onTwoPressed.call();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index == 1 ? kWhite : null,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: MyText(
                  widget.text2,
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                  fontStyle: FontStyle.poppins,
                  color: index == 1 ? kPrimaryBlue : null,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 2;
                });
                widget.onThreePressed.call();
              },
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx < 1) {
                  setState(() {
                    index = 1;
                  });
                  widget.onTwoPressed.call();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index == 2 ? kWhite : null,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: MyText(
                  widget.text3,
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                  fontStyle: FontStyle.poppins,
                  color: index == 2 ? kPrimaryBlue : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
