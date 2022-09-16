import 'package:beere_mobile/modules/onboarding_module/controller/home_page_controller.dart';
import 'package:beere_mobile/widgets/appbar.dart';
import 'package:beere_mobile/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
      context,
    leading: RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: "Welcome,",
        children: [
          TextSpan(
            text: 'Samson'
          )
        ]
      ),
    ),
    actions: [
      Container(
              padding: EdgeInsets.only(right: 15),
              height: 40,
              width: 40,
              child: Image.asset(
                "assets/vector.png",
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/homepics.jpg',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
    ]

      ),
      extendBodyBehindAppBar: true,
      body: Background(
        child: SingleChildScrollView(

        ),
      ),
    );
  }
}
