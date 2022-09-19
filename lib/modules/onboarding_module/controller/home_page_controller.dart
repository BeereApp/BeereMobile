import 'package:beere_mobile/Models/product_of_the_week.dart';
import 'package:beere_mobile/Models/promotions.dart';
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
     title: "Product Of The\nWeek",
     subtitle: "Classic Soft Drinks",
     text: "One of the important product we have\n in product of the week, One of the important product we have\n in product of the week",
     imageUrl: Assets.cokeImage
     ),
      Product(
        id: 1,
        title: "Product Of The\nWeek",
        subtitle: "Classic Soft Drinks",
        text: "One of the important product we have\n in product of the week, One of the important product we have\n in product of the week",
        imageUrl: Assets.cokeImage,
        ),
  ].obs;

List<Promotion> firstPromotion = [
    Promotion(
        id: 1,
        title: "15% Discount\nAvailable on",
        subtitle: "Fresh Basket of Pear",
        text: "One of the important product we have\n in product of the week, One of the important product we have\n in product of the week",
        imageUrl: Assets.pearImage),
    Promotion(
      id: 1,
       title: "15% Discount\nAvailable on",
      subtitle: "Fresh Basket of Pear",
      text: "One of the important product we have\n in product of the week",
      imageUrl: Assets.pearImage,
    ),
  ].obs;

  //  [
  //   {"title": "Product Of The Week"},
  //   {"subtitle": "Classic Soft Drinks"},
  //   {"text": "One of the important product we have in product of the week"},
  //   {"image": "Assets.cokeImage"}
  // ].obs;
}
