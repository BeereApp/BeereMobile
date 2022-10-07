import 'package:get/get.dart';

class VendorProfileController extends GetxController {
  //0 for Personal Info
  //1 for Business Info
  final RxInt _index = 0.obs;
  set index(int value) => _index.value = value;
  int get index => _index.value;
}
