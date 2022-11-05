import 'package:beere_mobile/modules/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/modules/vendor/home_page_module/controller/vendor_search_view_controller.dart';
import 'package:beere_mobile/modules/vendor/home_page_module/view/custom_widgets.dart';
import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/inputs.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VendorSearchView extends StatelessWidget {
  static const String route = '/vendor_search_view';

  const VendorSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<VendorSearchViewController>(
        init: VendorSearchViewController(),
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
                            // OnTapFade(
                            //   onTap: () {},
                            //   child: SvgPicture.asset(Assets.micIcon),
                            // ),
                            // Gap(4.w),
                            OnTapFade(
                              onTap: () {
                                Get.dialog(const FilterDialog());
                              },
                              child: SvgPicture.asset(Assets.filterIcon),
                            ),
                            Gap(8.w),
                          ],
                        ),
                      ),
                      // SearchView(),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return SearchItem();
                            }),
                      ),
                      Gap(24.h),
                      PrimaryButton(
                        enabled: controller.searchText.isNotEmpty,
                        onPressed: () {},
                        text: 'SEARCH',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
