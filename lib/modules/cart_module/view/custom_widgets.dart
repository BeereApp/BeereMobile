import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.textStyle,
    this.padding,
    this.textColor,
    this.fontSize,
  });

  final VoidCallback onPressed;
  final Widget? child;
  final String? text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return OnTapFade(
      onTap: onPressed,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 4.r, vertical: 4.r),
        decoration: BoxDecoration(
          border: Border.all(color: kLightGray, width: 0.5),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: child ??
            MyText(
              text ?? '',
              color: textColor ?? kPrimaryBlue,
              fontStyle: FontStyle.poppins,
              fontSize: fontSize ?? 14.sp,
            ),
      ),
    );
  }
}
