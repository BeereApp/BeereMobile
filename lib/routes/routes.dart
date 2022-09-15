import 'package:beere_mobile/modules/onboarding_module/view/login_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/register_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/select_category_view.dart';
import 'package:beere_mobile/modules/splash_screen_module/view/splash_screen_main_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.route:
      return PageTransition(
          child: const SplashScreen(), type: PageTransitionType.rightToLeft);
    case SelectCategoryView.route:
      return PageTransition(
          child: const SelectCategoryView(),
          type: PageTransitionType.rightToLeft);
    case LoginView.route:
      return PageTransition(
          child: const LoginView(), type: PageTransitionType.rightToLeft);
    case RegisterView.route:
      return PageTransition(
          child: const RegisterView(), type: PageTransitionType.rightToLeft);
    default:
      return null;
  }
}
