import 'package:beere_mobile/utils/app_assets.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:beere_mobile/widgets/buttons.dart';
import 'package:beere_mobile/widgets/cart_button.dart';
import 'package:beere_mobile/widgets/on_tap_fade.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Cart extends StatelessWidget {
  static const String route = '/cart_page';
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        leading: OnTapFade(
          onTap: () => Navigator.of(context).pop(),
          child: SvgPicture.asset(Assets.downArrow),
        ),
        centerTitle: false,
        //titleText: "Cart",
        titleSpacing: 5,
        title: Padding(
          padding: const EdgeInsets.only( top: 15),
          child: MyText("Cart"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:14.0, top: 15),
            child: OnTapFade(
            onTap: () {},
            child: SvgPicture.asset(Assets.searchIcon),
        ),
          ),
        ]

      ),
      extendBodyBehindAppBar: true,
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: AssetImage(Assets.cartImage),
                    width: 135.w,
                    height: 100.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        "Banana Pizza",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.poppins,
                        color: kBlack,
                      ),
                      MyText(
                        "3 pieces",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.poppins,
                        color: kCartTwo,
                      ),
                      MyText(
                        "\$03.00",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.poppins,
                        color: kPrimaryBlue,
                      )
                    ],
                  )
                ],
              ),
              Gap(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OnTapFade(
                    onTap: () {},
                    child: SvgPicture.asset(Assets.likeIcon),
                  ),
                  OnTapFade(
                    onTap: () {},
                    child: SvgPicture.asset(Assets.deleteIcon),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kCartIncrement,
                        borderRadius: BorderRadius.circular(6.r)),
                    // child: SizedBox(
                    //   height: 25.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          IconButton(onPressed: null, icon: Icon(Icons.remove, size: 15,)),
                          Text("1"),
                          IconButton(onPressed: null, icon: Icon(Icons.add, size: 15,
                              )),
                        ],
                      ),
                    ),
                 // )
                ],
              ),
              Gap(30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    "Total",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.poppins,
                    color: kBlack,
                  ),
                  MyText(
                    "\$03.00",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.poppins,
                    color: kBlack,
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    "Door-step Delivery",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.poppins,
                    color: kScrollGrey,
                  ),
                  CartButton(
                    onPressed: (){},
                    enabled: false,
                    child: const Icon(Icons.check))
                  //const IconButton(onPressed: null, icon: Icon(Icons.check))
                ],
              ),
              const Divider(),
              //MyText("Address"),
              RichText(
                  text: TextSpan(
                      text: "Address",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kCartContact,
                      ),
                      children: [
                    const WidgetSpan(
                        child: SizedBox(
                      width: 10,
                    )),
                    TextSpan(
                      text: "Edit >",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kPrimaryBlue,
                      ),
                    )
                  ])),
              Gap(5.h),
              MyText(
                  "Dolor Lorem magna commodo nulla voluptate\nnostrud dolor commodo nisi laborum aliqua duis\nvelit laborum. "),
              Gap(5.h),
              MyText(
                "Contact details",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.poppins,
                color: kCartContact,
              ),
              Gap(5.h),
              MyText(
                "+23470112623",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.poppins,
                color: kCartNumber,
              ),
              Gap(5.h),
              MyText(
                "joshuaaleke0@gmail.com",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.poppins,
                color: kCartNumber,
              ),
              Divider(),
              RichText(
                  text: TextSpan(
                      text: "In-Store Delivery",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kCartContact,
                      ),
                      children: [
                    const WidgetSpan(
                        child: SizedBox(
                      width: 10,
                    )),
                    TextSpan(
                      text: "Choose Store >",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kPrimaryBlue,
                      ),
                    )
                  ])),
              Divider(),
              MyText("Dolor Lorem magna commodo nulla voluptate\nnostrud dolor commodo nisi laborum aliqua duis\nvelit laborum. Dolor Lorem magna commodo nulla\nvoluptate nostrud dolor commodo nisi laborum\naliqua duis velit laborum. Dolor Lorem magna\ncommodo nulla voluptate nostrud dolor commodo\nnisi laborum aliqua duis velit laborum.  ",
              fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.poppins,
                color: kCartNumber,
              ),
              Gap(5.h),
              PrimaryButton(onPressed: (){},
              text: "Complete",
              )
            ],
          ),
        ),
      ),
    );
  }
}
