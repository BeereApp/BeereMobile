import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.name,
    required this.date,
    this.comment,
    required this.review,
  });
  final String name;
  final DateTime date;
  final String? comment;
  final bool review;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24.r,
          child: Image.asset(
            Assets.userImage,
            fit: BoxFit.cover,
          ),
        ),
        Gap(16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                name,
                fontStyle: FontStyle.poppins,
                fontWeight: FontWeight.w600,
                fontSize: 13.5.sp,
                color: kBlack,
                height: 1.2.sp,
              ),
              MyText(
                DateFormat('y - MM - dd').format(date),
                fontStyle: FontStyle.poppins,
                fontSize: 12.sp,
                color: kScrollGrey,
                height: 1.2.sp,
              ),
              Gap(10.h),
              MyText(
                comment ?? '',
                fontStyle: FontStyle.poppins,
                fontSize: 11.sp,
              ),
            ],
          ),
        ),
        Gap(10.w),
        SvgPicture.asset(
          review ? Assets.thumbsUpIcon : Assets.thumbsDownIcon,
          width: 22.r,
          height: 22.r,
        )
      ],
    );
  }
}
