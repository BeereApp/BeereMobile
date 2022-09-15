import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropDownMenuWidget extends StatelessWidget {
  ///DropDownMenuWidget to select an item from a list of items.
  ///itemList and onChanged are required.
  ///When the widget is to be used in a row with another widget, set [isExpanded]
  ///to false and [isDense] to true.
  const DropDownMenuWidget(
      {Key? key,
      required this.itemList,
      this.value,
      this.padding,
      required this.onChanged,
      this.isExpanded = true,
      this.isDense = false,
      this.textStyle,
      this.hint,
      this.boxDecoration,
      this.icon})
      : super(key: key);

  final List<String> itemList;
  final String? value;
  final EdgeInsetsGeometry? padding;
  final dynamic onChanged;
  final bool isExpanded;
  final bool isDense;
  final TextStyle? textStyle;
  final Widget? hint;
  final BoxDecoration? boxDecoration;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration ??
          BoxDecoration(
            border: Border.all(color: kBorderColor),
            borderRadius: BorderRadius.circular(12.0),
          ),
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(vertical: 16.0.r, horizontal: 19.0.r),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            icon: icon ??
                SvgPicture.asset(Assets.downArrow, width: 12.w, height: 6.h),
            menuMaxHeight: MediaQuery.of(context).size.height / 2,
            isDense: isDense,
            hint: hint,
            disabledHint: hint,
            onChanged: onChanged,
            isExpanded: isExpanded,
            style: textStyle ?? kStyleInter.copyWith(fontSize: 16.0.sp),
            items: itemList
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: kStyleInter,
                        )))
                .toList(),
          ),
        ),
      ),
    );
  }
}
