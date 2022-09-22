import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
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
              disabledForegroundColor: kPrimaryBlue.withOpacity(0.56),
              disabledBackgroundColor: kPrimaryBlue.withOpacity(0.38),
              padding: padding ??
                  EdgeInsets.symmetric(
                      vertical: child != null ? 16.h : 22.h, horizontal: 20.w),
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
    return isCenter
        ? Center(
            child: TextButton(
              onPressed: enabled ? onPressed : null,
              style:
                  buttonStyle ?? TextButton.styleFrom(padding: EdgeInsets.zero),
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
            ),
          )
        : TextButton(
            onPressed: enabled ? onPressed : null,
            style:
                buttonStyle ?? TextButton.styleFrom(padding: EdgeInsets.zero),
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
          );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.label,
    this.hasShadow = false,
    this.shadowColor,
    this.color,
    this.textColor,
    this.fontSize,
    this.onTap,
    this.borderRadius,
    this.border,
    this.fontWeight,
    this.padding,
    this.margin,
  });

  final String label;
  final bool hasShadow;
  final Color? shadowColor;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onTap;
  final double? borderRadius;
  final BoxBorder? border;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return OnTapFade(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: margin,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          border: border,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: color ?? kPrimaryBlue.withOpacity(0.1),
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                  )
                ]
              : null,
          color: color ?? kWhite,
        ),
        child: MyText(
          label,
          textAlign: TextAlign.center,
          color: textColor,
          fontStyle: FontStyle.poppins,
          fontSize: fontSize ?? 11.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
        ),
      ),
    );
  }
}
