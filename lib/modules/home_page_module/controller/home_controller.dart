import 'package:get/get.dart';

class HomeController extends GetxController {

   List<String> productItem =
      ["Best Selling", "Furniture", "Electronics", "Drinks", "Food"].obs;

  void reorder(int oldIndex, int newIndex) {
    final item = productItem.removeAt(oldIndex);
    productItem.insert(newIndex, item);
  }


}