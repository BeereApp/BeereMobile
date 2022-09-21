import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.onPressed,
    this.child, this.text,
    required this.enabled,
    this.textStyle,
    this.padding,
    this.buttonStyle,
    this.backgroundColor,
    this.textColor,
    });

  final VoidCallback onPressed;
  final Widget? child;
  final String? text;
  final bool enabled;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? buttonStyle;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: buttonStyle ??
      ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? kWhite,
           // disabledForegroundColor: kPrimaryBlue.withOpacity(0.56),
            disabledBackgroundColor: kWhite.withOpacity(0.38),
            padding: padding ??
                EdgeInsets.symmetric(
                    vertical: child != null ? 5.h : 5.h, horizontal: 5.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
                side: BorderSide(color: kTextGray)
                ),
          ),
      child: Align(
          child: Center(
            child: child ??
                Text(
                  text ?? ' ',
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      kStylePoppins.copyWith(
                        color: textColor ?? kPrimaryBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        letterSpacing: 1.sp,
                      ),
                ),
          ),
        ),
      );
  }
}