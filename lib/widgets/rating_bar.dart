import 'package:beere_mobile/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.rating});
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < rating; i++)
          Padding(
            padding: EdgeInsets.only(right: 5.0.w),
            child: SvgPicture.asset(
              Assets.starFilledIcon,
              width: 15.r,
              height: 15.r,
            ),
          ),
        for (int i = 0; i < 5 - rating; i++)
          Padding(
            padding: EdgeInsets.only(right: 5.0.w),
            child: SvgPicture.asset(
              Assets.starIcon,
              width: 15.r,
              height: 15.r,
            ),
          ),
      ],
    );
  }
}
