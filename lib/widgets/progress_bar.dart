import 'dart:math';

import 'package:beere_mobile/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
      {super.key,
      this.height,
      this.color,
      required this.progress,
      required this.total,
      this.borderRadius});
  final double? height;
  final Color? color;
  final double progress;
  final double total;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      height: height ?? 6.0.h,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: kInputFillColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 2.r)),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor:
              max(min(((progress) / (total == 0 ? 1 : total)), 1.0), .01),
          child: Container(
              height: 7.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color ?? kPrimaryYellow,
                  borderRadius: BorderRadius.circular(borderRadius ?? 2.r))),
        ),
      ),
    );
  }
}
