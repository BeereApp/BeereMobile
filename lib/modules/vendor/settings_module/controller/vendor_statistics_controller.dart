import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VendorStatisticsController extends GetxController {
  final _index = 0.obs;

  int get index => _index.value;

  set index(value) => _index.value = value;

  double getChartHeight(int length) {
    if (length == 0) {
      return (36 + (30 * 1)).h;
    } else if (length < 6) {
      return (36 + (30 * length)).h;
    } else {
      return (36 + (30 * 6)).h;
    }
  }
}
