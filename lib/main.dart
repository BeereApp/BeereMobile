import 'package:beere_mobile/app_binding.dart';
import 'package:beere_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modules/splash_screen_module/view/splash_screen_main_view.dart';
import 'utils/my_scroll_behaviour.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AppBinding(),
        title: 'Beere',
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
              .apply(fontSizeFactor: 1.sp),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, widget) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          widget = ScrollConfiguration(
            behavior: const MyScrollBehavior(),
            child: widget!,
          );
          return widget;
        },
        initialRoute: SplashScreen.route,
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}
