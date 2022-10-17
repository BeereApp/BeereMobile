import 'package:get/get.dart';

class VendorDownloadReportController extends GetxController {
  final RxBool _isPdf = true.obs;

  set isPdf(bool value) => _isPdf.value = value;

  bool get isPdf => _isPdf.value;
}
