import 'package:beere_mobile/models/profile_model.dart';
import 'package:beere_mobile/modules/home_page_module/controller/user_search_controller.dart';
import 'package:beere_mobile/modules/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/rating_bar.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserSearchView extends StatelessWidget {
  static const String route = '/user_search_view';

  const UserSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<UserSearchController>(
      init: UserSearchController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            if (controller.focusNode.hasFocus) {
              FocusManager.instance.primaryFocus?.unfocus();
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              appBar: customAppbar(
                context,
                title: MyText('Beere',
                    fontSize: 27.sp,
                    fontStyle: FontStyle.poppins,
                    color: kPrimaryBlue.withOpacity(0.25),
                    fontWeight: FontWeight.w700),
              ),
              extendBodyBehindAppBar: true,
              body: Background(
                padding: EdgeInsets.fromLTRB(25.w, 0.h, 25.h, 25.h),
                child: Column(
                  children: [
                    InputWidget(
                      controller: controller.searchController,
                      fillColor: kWhite,
                      focusNode: controller.focusNode,
                      onChanged: (value) => controller.searchText = value,
                      onFieldSubmitted: (value) => controller.search(),
                      hasLabel: false,
                      filled: true,
                      hintText: 'Search products, vendors, brands...',
                      prefixIcon: SvgPicture.asset(
                        Assets.searchIcon,
                        fit: BoxFit.scaleDown,
                        width: 20.r,
                        height: 20.r,
                      ),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OnTapFade(
                            onTap: () {
                              Get.dialog(const FilterDialog());
                            },
                            child: SvgPicture.asset(Assets.filterIcon),
                          ),
                          Gap(8.w),
                          OnTapFade(
                            onTap: () {},
                            child: SvgPicture.asset(
                              Assets.cameraIcon,
                              color: const Color(0xFF898A8D),
                            ),
                          ),
                          Gap(8.w),
                        ],
                      ),
                    ),
                    Gap(16.h),
                    //Category List
                    SizedBox(
                      height: 26.h,
                      child: ReorderableListView(
                        padding: EdgeInsets.only(left: 8.w),
                        scrollDirection: Axis.horizontal,
                        onReorder: ((oldIndex, newIndex) =>
                            controller.reorder(oldIndex, newIndex)),
                        children: controller.categoryList.map((e) {
                          final index = controller.categoryList.indexOf(e);
                          final selected = controller.selectedCategory == index;
                          return CardButton(
                            onTap: () => controller.setSelected(index),
                            key: ValueKey(e),
                            label: e,
                            color: selected ? kPrimaryBlue : null,
                            textColor: selected ? kWhite : null,
                            hasShadow: selected ? false : true,
                            margin: EdgeInsets.only(right: 14.w),
                          );
                        }).toList(),
                      ),
                    ),
                    // SearchView(),
                    Expanded(
                      child: controller.isProcessing
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryBlue,
                              ),
                            )
                          : controller.searchList.isEmpty
                              ? Center(
                                  child: MyText(
                                    'No result!',
                                    fontSize: 28.sp,
                                  ),
                                )
                              : Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        MyText(
                                          'Select all stores',
                                          fontSize: 14.sp,
                                          fontStyle: FontStyle.poppins,
                                        ),
                                        Gap(12.w),
                                        Checkbox(
                                          value: controller.selectAll,
                                          onChanged: (value) {
                                            controller.selectAll = value!;
                                            for (int i = 0;
                                                i <
                                                    controller
                                                        .searchList.length;
                                                i++) {
                                              controller.searchList[i] =
                                                  controller.searchList[i]
                                                      .copyWith(
                                                          selected: value);
                                            }
                                          },
                                          side: const BorderSide(
                                              color: kLightGray, width: 0.5),
                                          fillColor: MaterialStateProperty.all(
                                              kPrimaryBlue),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount:
                                              controller.searchList.length,
                                          itemBuilder: (context, index) {
                                            final search =
                                                controller.searchList[index];
                                            return _searchItem(
                                                vendor: search.vendor,
                                                selected: search.selected,
                                                onChanged: (value) {
                                                  controller.searchList[index] =
                                                      search.copyWith(
                                                          selected: value);
                                                });
                                          }),
                                    ),
                                  ],
                                ),
                    ),
                    Gap(24.h),
                    PrimaryButton(
                      onPressed: () => controller.isSearch.value
                          ? controller.search()
                          : controller.sendToStores(),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: controller.isProcessing
                            ? Center(
                                child: SizedBox(
                                  height: 22.r,
                                  width: 22.r,
                                  child: const CircularProgressIndicator(
                                    color: kWhite,
                                  ),
                                ),
                              )
                            : MyText(
                                controller.isSearch.value ? 'SEARCH' : 'SEND',
                                textAlign: TextAlign.center,
                                color: kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _searchItem(
      {required bool selected,
      required void Function(bool?)? onChanged,
      required VendorProfileModel vendor}) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: kWhite,
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 4.w),
              child: Row(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.contain,
                    height: 48.h,
                    width: 60.w,
                    imageUrl: vendor.businessImage ?? '',
                    errorWidget: (context, url, error) => Icon(
                      Icons.question_mark,
                      size: 50.r,
                      color: kBlack,
                    ),
                    placeholder: (context, url) => Icon(
                      Icons.question_mark,
                      size: 50.r,
                      color: kBlack,
                    ),
                  ),
                  Gap(4.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          vendor.companyRegisteredName,
                          fontStyle: FontStyle.poppins,
                          fontSize: 11.sp,
                          height: 1,
                          fontWeight: FontWeight.w500,
                        ),
                        MyText(
                          'Laptops, Phones',
                          fontStyle: FontStyle.poppins,
                          fontSize: 11.sp,
                          height: 1,
                          fontWeight: FontWeight.w200,
                        ),
                        Gap(4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                RatingBar(
                                  rating: 4,
                                  size: 10.r,
                                ),
                                Gap(2.h),
                                MyText(
                                  '(55k ratings)',
                                  fontStyle: FontStyle.poppins,
                                  color: kBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(4.w),
        Checkbox(
          value: selected,
          onChanged: onChanged,
          side: const BorderSide(color: kLightGray, width: 0.5),
          fillColor: MaterialStateProperty.all(kPrimaryBlue),
        ),
      ],
    );
  }
}
