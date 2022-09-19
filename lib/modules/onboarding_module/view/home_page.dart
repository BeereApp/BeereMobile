import 'package:beere_mobile/modules/onboarding_module/controller/home_page_controller.dart';
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

class HomePage extends GetView<HomePageController> {
  static const String route = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController product = Get.put(HomePageController());
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      'Welcome,',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: kTextGray,
                      fontStyle: FontStyle.poppins,
                    ),
                    MyText(
                      'Samson,',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kTextGray,
                      fontStyle: FontStyle.poppins,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: OnTapFade(
                        onTap: null,
                        child: SvgPicture.asset(
                          Assets.notificationIcon,
                          height: 20.r,
                          width: 20.r,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(Assets.homeImage),
                    )
                  ],
                )
              ],
            ),
            Gap(10.h),
            InputWidget(
              label: true,
              hintText: 'Search products, vendors, brands...',
              prefixIcon: OnTapFade(
                onTap: null,
                child: SvgPicture.asset(
                  Assets.searchIcon,
                  fit: BoxFit.scaleDown,
                  width: 10,
                  height: 10,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OnTapFade(
                      onTap: null,
                      child: SvgPicture.asset(Assets.micIcon),
                    ),
                    OnTapFade(
                      onTap: null,
                      child: SvgPicture.asset(Assets.filterIcon),
                    ),
                  ],
                ),
              ),
            ),
            Gap(8.h),
            Obx((() => Container(
                  height: 51.h,
                  child: ReorderableListView(
                    scrollDirection: Axis.horizontal,
                    onReorder: ((oldIndex, newIndex) =>
                        controller.reorder(oldIndex, newIndex)),
                    children: controller.productItem
                        .map((e) => Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              key: ValueKey(e),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: kPrimaryBlue.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                  )
                                ],
                                color: kWhite,
                              ),
                              child: MyText(
                                e,
                                fontSize: 12.sp,
                                textAlign: TextAlign.center,
                                color: kTextGray,
                              ),
                            ))
                        .toList(),
                  ),
                ))),
            Gap(15.h),
            Obx(() => Container(
                  height: 170.h,
                  width: 400.w,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.firstProduct.length,
                      itemBuilder: (context, index) => Card(
                            key: ValueKey(index),
                            elevation: 5,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: MyText(
                                        controller.firstProduct[index].title,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FontStyle.poppins,
                                        color: kProductOne,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: MyText(
                                        controller.firstProduct[index].subtitle,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.poppins,
                                        color: kProductOne,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: MyText(
                                        controller.firstProduct[index].text,
                                        fontSize: 6.sp,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.poppins,
                                        color: kProductOne,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                      Gap(20.h),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                        child: SizedBox(
                                          height: 20.h,
                                          child: ElevatedButton(
                                            onPressed: null,
                                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  kWhite),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  kPrimaryYellow),
                              shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.r)))),
                                          child: Text("ORDER NOW",
                                          style: TextStyle(
                                                 fontSize: 6.sp,
                                              fontWeight: FontWeight.w700,
                                              ),
                                          ),
                                          ),
                                        ),
                                      )

                                      //  PrimaryButton(
                                      //     text: "ORDER NOW",
                                      //     textStyle: TextStyle(
                                      //       fontSize: 6.sp,
                                      //       fontWeight: FontWeight.w700,

                                      //     ),
                                      //     onPressed: () {}),

                                  ],
                                ),
                                Image.asset(
                                  controller.firstProduct[index].imageUrl,
                                  width: 200.w,
                                  height: 150.h,
                                )
                              ],
                            ),
                          )),
                )),
            Gap(15.h),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: EdgeInsets.only(top: 1, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      'Promotions',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.poppins,
                      color: kTextGray,
                    ),
                    MyText(
                      'See All',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.poppins,
                      color: kTextGray,
                    )
                  ],
                ),
              ),
            ),
            Gap(10.h),

            Obx(() => Container(
                  height: 170.h,
                  width: 400.w,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.firstPromotion.length,
                      itemBuilder: (context, index) => Card(
                            key: ValueKey(index),
                            elevation: 5,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: MyText(
                                        controller.firstPromotion[index].title,
                                        maxLines: 10,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FontStyle.poppins,
                                        color: kProductOne,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: MyText(
                                        controller
                                            .firstPromotion[index].subtitle,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.poppins,
                                        color: kProductOne,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: MyText(
                                        controller.firstPromotion[index].text,
                                        fontSize: 6.sp,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.poppins,
                                        color: kProductOne,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                     Gap(20.h),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: SizedBox(
                                        height: 20.h,
                                        child: ElevatedButton(
                                          onPressed: null,
                                          style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(kWhite),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(kPrimaryGreen),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r)))),
                                          child: Text(
                                            "ORDER NOW",
                                            style: TextStyle(
                                              fontSize: 6.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                                Image.asset(
                                  controller.firstPromotion[index].imageUrl,
                                  width: 200.w,
                                  height: 150.h,
                                )
                              ],
                            ),
                          )),
                )),

          ],
        ),
      ),
    );
  }
}

//  Container(
//                child: RichText(
//         textAlign: TextAlign.left,
//         text: TextSpan(
//         text: "Welcome,",
//         children: [
//           TextSpan(
//             text: 'Samson'
//           )
//         ]
//       ),
//     ),
//              ),