import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  final firstDigit = (-1).obs;
  final secondDigit = (-1).obs;
  final thirdDigit = (-1).obs;
  final fourthDigit = (-1).obs;
  //String _otp = '';
  final isOtpValid = false.obs;

  void setOtp(int number) {
    if (firstDigit.isNegative) {
      firstDigit.value = number;
    } else if (secondDigit.isNegative) {
      secondDigit.value = number;
    } else if (thirdDigit.isNegative) {
      thirdDigit.value = number;
    } else if (fourthDigit.isNegative) {
      fourthDigit.value = number;
    }
    _validate();
  }

  void backSpace() {
    if (!fourthDigit.isNegative) {
      fourthDigit.value = -1;
    } else if (!thirdDigit.isNegative) {
      thirdDigit.value = -1;
    } else if (!secondDigit.isNegative) {
      secondDigit.value = -1;
    } else if (!firstDigit.isNegative) {
      firstDigit.value = -1;
    }
    _validate();
  }

  void _validate() {
    if (!fourthDigit.isNegative) {
      isOtpValid.value = true;
    } else {
      isOtpValid.value = false;
    }
  }
}
