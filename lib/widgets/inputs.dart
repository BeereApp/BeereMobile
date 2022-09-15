import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyBoardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool label;
  final bool obscureText;
  final bool multiLine;
  final bool enabled;
  final bool readOnly;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;

  /// A custom TextFormField to accept user input
  const InputWidget({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.validator,
    this.keyBoardType,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.label = false,
    this.obscureText = false,
    this.multiLine = false,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText ?? '',
          style: TextStyle(
              fontSize: 14.sp,
              letterSpacing: -0.02.sp,
              color: kTextGray,
              height: (22 / 14).sp),
        ),
        Gap(4.h),
        SizedBox(
          //height: 54.0,
          child: TextFormField(
            initialValue: initialValue,
            readOnly: readOnly,
            enabled: enabled,
            maxLines: multiLine ? null : 1,
            expands: multiLine ? true : false,
            cursorColor: kTextGray,
            textAlignVertical:
                multiLine ? TextAlignVertical.top : TextAlignVertical.center,
            autocorrect: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: keyBoardType,
            obscureText: obscureText,
            controller: controller,
            obscuringCharacter: '*',
            inputFormatters: inputFormatters,
            style: kStyleInter.copyWith(fontSize: 16.0.sp),
            decoration: InputDecoration(
              fillColor: kInputFillColor,
              filled: true,
              isDense: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              suffix: Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: suffix,
              ),
              prefix: Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: prefix,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kBorderColor),
                  borderRadius: BorderRadius.circular(12.0)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 16.0.w),
              hintText: !enabled && initialValue != null ? null : hintText,
              hintStyle: kStyleInter.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 14.0.sp,
                height: (20.12 / 14.0).sp,
                color: kLightGray,
              ),
              errorStyle: kStyleInter.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 10.0.sp,
                height: 1,
                color: kPrimaryRed,
              ),
              labelText: label
                  ? !enabled && initialValue != null
                      ? null
                      : hintText
                  : null,
              labelStyle: kStyleInter.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 14.0.sp,
                height: (22 / 14.0).sp,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kBorderColor),
                  borderRadius: BorderRadius.circular(12.0)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimaryRed),
                  borderRadius: BorderRadius.circular(12.0)),
            ),
            onChanged: (String value) => onChanged?.call(value),
            validator: (String? value) => validator?.call(value),
          ),
        ),
      ],
    );
  }
}
