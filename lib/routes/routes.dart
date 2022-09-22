import 'package:beere_mobile/modules/cart_module/view/cart.dart';
import 'package:beere_mobile/modules/dashboard_module/view/dashboard_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/home_page.dart';
import 'package:beere_mobile/modules/home_page_module/view/notification_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/promotion_detail_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/promotion_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/user_vendor_more_info_page.dart';
import 'package:beere_mobile/modules/home_page_module/view/user_vendor_more_review_page.dart';
import 'package:beere_mobile/modules/home_page_module/view/user_view_vendor_page.dart';
import 'package:beere_mobile/modules/onboarding_module/view/change_password_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/forgot_password_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/login_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/register_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/select_category_view.dart';
import 'package:beere_mobile/modules/onboarding_module/view/verify_otp_view.dart';
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
    case VerifyOTPView.route:
      return PageTransition(
          child: const VerifyOTPView(), type: PageTransitionType.rightToLeft);
    case ForgotPasswordView.route:
      return PageTransition(
          child: const ForgotPasswordView(),
          type: PageTransitionType.rightToLeft);
    case ChangePasswordView.route:
      return PageTransition(
          child: const ChangePasswordView(),
          type: PageTransitionType.rightToLeft);
    case DashboardView.route:
      return PageTransition(
          child: const DashboardView(), type: PageTransitionType.rightToLeft);
    case HomePage.route:
      return PageTransition(
          child: HomePage(), type: PageTransitionType.rightToLeft);
    case Cart.route:
      return PageTransition(
        child: Cart(), type: PageTransitionType.rightToLeft);
    case PromotionView.route:
      return PageTransition(
          child: const PromotionView(), type: PageTransitionType.rightToLeft);
    case PromotionDetailView.route:
      return PageTransition(
          child: const PromotionDetailView(),
          type: PageTransitionType.rightToLeft);
    case UserViewVendorPage.route:
      return PageTransition(
          child: const UserViewVendorPage(),
          type: PageTransitionType.rightToLeft);
    case UserVendorMoreInfoView.route:
      return PageTransition(
          child: const UserVendorMoreInfoView(),
          type: PageTransitionType.rightToLeft);
    case UserVendorMoreReviewView.route:
      return PageTransition(
          child: const UserVendorMoreReviewView(),
          type: PageTransitionType.rightToLeft);
    case NotificationView.route:
      return PageTransition(
          child: const NotificationView(),
          type: PageTransitionType.rightToLeft);
    default:
      return null;
  }
}
