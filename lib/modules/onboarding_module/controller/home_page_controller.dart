import 'package:beere_mobile/Models/product_of_the_week.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:beere_mobile/utils/app_assets.dart';

class HomePageController extends GetxController {
  @override
  List<String> productItem =
      ["Best Selling", "Furniture", "Electronics", "Drinks", "Food"].obs;

  void reorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex = -1;
    }
    final items = productItem.removeAt(oldIndex);
    productItem.insert(newIndex, items);
  }

  List<Product> firstProduct = [
    Product(
      id: 1,
     title: "Product Of The Week",
     subtitle: "Classic Soft Drinks",
     text: "One of the important product we have in product of the week",
     imageUrl: Assets.cokeImage
     ),
      Product(
        id: 1,
        title: "Product Of The Week",
        subtitle: "Classic Soft Drinks",
        text: "One of the important product we have in product of the week",
        imageUrl: Assets.cokeImage,
        ),
  ].obs;

  //  [
  //   {"title": "Product Of The Week"},
  //   {"subtitle": "Classic Soft Drinks"},
  //   {"text": "One of the important product we have in product of the week"},
  //   {"image": "Assets.cokeImage"}
  // ].obs;
}
