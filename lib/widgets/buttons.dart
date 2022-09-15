import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.onPressed,
      this.text,
      this.child,
      this.textStyle,
      this.padding,
      this.buttonStyle,
      this.enabled = true,
      this.backgroundColor,
      this.textColor});

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.0.w),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? kPrimaryBlue,
              disabledForegroundColor: kPrimaryBlue.withOpacity(0.38),
              disabledBackgroundColor: kPrimaryBlue.withOpacity(0.12),
              padding: padding ??
                  EdgeInsets.symmetric(vertical: 22.h, horizontal: 20.w),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
            ),
        child: Align(
          child: Center(
            child: child ??
                Text(
                  text ?? ' ',
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      kStylePoppins.copyWith(
                        color: textColor ?? Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        letterSpacing: 1.sp,
                      ),
                ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.enabled = true,
    this.textStyle,
    this.fontSize,
    this.buttonStyle,
    this.hasUnderline = true,
    this.textColor,
    this.isCenter = true,
  });

  final VoidCallback onPressed;
  final Widget? child;
  final String? text;
  final bool enabled;
  final TextStyle? textStyle;
  final double? fontSize;
  final ButtonStyle? buttonStyle;
  final bool hasUnderline;
  final Color? textColor;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      style: buttonStyle ?? TextButton.styleFrom(padding: EdgeInsets.zero),
      child: isCenter
          ? Align(
              child: child ??
                  Text(
                    text ?? ' ',
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        kStyleInter.copyWith(
                          color: textColor ?? kTextGray,
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize ?? 16.sp,
                          decoration:
                              hasUnderline ? TextDecoration.underline : null,
                          letterSpacing: -0.02.sp,
                        ),
                  ),
            )
          : child ??
              Text(
                text ?? ' ',
                textAlign: TextAlign.center,
                style: textStyle ??
                    kStyleInter.copyWith(
                      decoration:
                          hasUnderline ? TextDecoration.underline : null,
                      color: textColor ?? kTextGray,
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize ?? 16.sp,
                      letterSpacing: -0.02.sp,
                    ),
              ),
    );
  }
}
