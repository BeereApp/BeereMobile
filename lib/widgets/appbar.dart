import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'on_tap_fade.dart';

///Custom appbar to be used across the screens
PreferredSizeWidget customAppbar(
  BuildContext context, {
  String titleText = '',
  Widget? title,
  double elevation = 0,
  double? titleSpacing,
  bool automaticallyImplyLeading = true,
  Widget? leading,
  Color? backgroundColor,
  IconThemeData? iconThemeData,
  TabBar? bottom,
  List<Widget>? actions,
  bool hasLeading = true,
  VoidCallback? onBackTap,
  double preferredSize = 55.0,
  bool centerTitle = true,
  Color? titleColor,
}) {
  return AppBar(
    centerTitle: centerTitle,
    leading: !hasLeading
        ? null
        : OnTapFade(
            onTap: onBackTap ?? () => Navigator.of(context).pop(),
            child: leading ??
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.0.w, top: 8.h),
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: const Color(0x80C4C4C4),
                        child: RotatedBox(
                          quarterTurns: 45,
                          child: SvgPicture.asset(
                            Assets.downArrow,
                            width: 16.w,
                            height: 8.h,
                            color: titleColor ?? kBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          ),
    automaticallyImplyLeading: automaticallyImplyLeading,
    backgroundColor: backgroundColor ?? Colors.transparent,
    elevation: elevation,
    titleSpacing: titleSpacing,
    bottom: bottom,
    iconTheme: iconThemeData,
    actions: actions,
    title: Padding(
      padding: EdgeInsets.only(top: 10.0.h),
      child: title ??
          MyText(titleText,
              overflow: TextOverflow.fade,
              fontSize: 20.0.sp,
              color: titleColor ?? const Color(0xFF929191),
              fontWeight: FontWeight.w600),
    ),
  );
}
