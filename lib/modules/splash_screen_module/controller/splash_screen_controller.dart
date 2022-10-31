import 'package:beere_mobile/modules/onboarding_module/view/select_category_view.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkForInternet();

    Future.delayed(const Duration(milliseconds: 3000), () => navigate());
  }

  Future<void> _checkForInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      _showSnackBar();
    }
  }

  void _showSnackBar() {
    CustomSnackBar.showGet(
        title: 'Error!',
        content: 'No Internet Connection',
        backgroundColor: kPrimaryRed,
        textColor: kWhite);
  }

  void navigate() =>
      Get.offNamedUntil(SelectCategoryView.route, (route) => false);
}
