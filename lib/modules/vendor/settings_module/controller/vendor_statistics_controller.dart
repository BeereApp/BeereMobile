import 'package:get/get.dart';

class VendorStatisticsController extends GetxController {
  final _index = 0.obs;

  int get index => _index.value;

  set index(value) => _index.value = value;
}
