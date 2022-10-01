import 'package:beere_mobile/modules/cart_module/view/cart_view.dart';
import 'package:beere_mobile/modules/dashboard_module/view/dashboard_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/home_page.dart';
import 'package:beere_mobile/modules/home_page_module/view/notification_view.dart';
import 'package:beere_mobile/modules/home_page_module/view/product_details_view.dart';
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
import 'package:beere_mobile/modules/profile_module/view/edit_profile_view.dart';
import 'package:beere_mobile/modules/profile_module/view/profile_view.dart';
import 'package:beere_mobile/modules/settings_module/view/about_view.dart';
import 'package:beere_mobile/modules/settings_module/view/favourite_view.dart';
import 'package:beere_mobile/modules/settings_module/view/settings_view.dart';
import 'package:beere_mobile/modules/splash_screen_module/view/splash_screen_main_view.dart';
import 'package:beere_mobile/modules/vendor/onboarding_module/view/vendor_home_page.dart';
import 'package:beere_mobile/modules/vendor/tabs_screen_module/view/tabs_view.dart';
import 'package:beere_mobile/modules/vendor/vendor_dashboard_module/view/vendor_dashboard_view.dart';
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
    case CartView.route:
      return PageTransition(
          child: const CartView(), type: PageTransitionType.rightToLeft);
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
    case VendorHomePage.route:
      return PageTransition(
          child: const VendorHomePage(), type: PageTransitionType.rightToLeft);
    case VendorDashboardView.route:
      return PageTransition(
          child: const VendorDashboardView(),
          type: PageTransitionType.rightToLeft);
    case TabsScreen.route:
      return PageTransition(
          child: const TabsScreen(), type: PageTransitionType.rightToLeft);
    case SettingsView.route:
      return PageTransition(
          child: const SettingsView(), type: PageTransitionType.rightToLeft);
    case AboutView.route:
      return PageTransition(
          child: const AboutView(), type: PageTransitionType.rightToLeft);
    case FavouriteView.route:
      return PageTransition(
          child: const FavouriteView(), type: PageTransitionType.rightToLeft);
    case ProfileView.route:
      return PageTransition(
          child: const ProfileView(), type: PageTransitionType.rightToLeft);
    case EditProfileView.route:
      return PageTransition(
          child: const EditProfileView(), type: PageTransitionType.rightToLeft);
    case ProductDetailView.route:
      return PageTransition(
          child: const ProductDetailView(),
          type: PageTransitionType.rightToLeft);

    default:
      return null;
  }
}
