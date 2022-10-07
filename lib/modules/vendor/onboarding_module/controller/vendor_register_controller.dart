import 'package:get/get.dart';

class VendorRegisterController extends GetxController {
  final RxInt _currentStep = 1.obs;
  final RxBool _termsCheckBox = false.obs;
  final RxBool _manufacturerCheckBox = false.obs;
  set currentStep(int value) => _currentStep.value = value;

  int get currentStep => _currentStep.value;

  set termsCheckBox(bool value) => _termsCheckBox.value = value;

  bool get termsCheckBox => _termsCheckBox.value;

  set manufacturerCheckBox(bool value) => _manufacturerCheckBox.value = value;

  bool get manufacturerCheckBox => _manufacturerCheckBox.value;

  final selectedCategoryList = <String>[].obs;
  final List<String> categoryList = [
    'Fashion',
    'Furniture',
    'Cosmetics',
    'Ceramics',
    'Pet',
    'Arts',
    'Stationary',
    'Fitness Kit',
    'Toy&Game',
    'Books',
    'Beauty',
    'Medicine',
    'Electronics',
    'Automobile',
    'Phones',
    'Laptops'
  ];
}
