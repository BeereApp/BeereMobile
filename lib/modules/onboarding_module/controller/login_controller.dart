import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final passwordVisibility = false.obs;
  final isProcessing = false.obs;
  final isError = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void forgotPassword() {}

  Future<void> login() async {
    bool hasInternet = await checkForInternet();
    if (!hasInternet) {
      CustomSnackBar.showGet(
          title: 'Error!',
          content: 'No Internet Connection',
          backgroundColor: kPrimaryRed,
          textColor: kWhite);
      return;
    }
    isProcessing.value = true;
    isError.value = false;
  }
}
