import 'product_model.dart';

class Item {
  static List<ProductModel> generateProducts() {
    return [
      ProductModel(
         1,
         "Best Selling",
         'Italian',
         "20",
         "4",
         "assets/5a.png",
         "Classic soft drink"
      ),
        ProductModel(2, "Furniture", 'Italian', "20", "4", "assets/5a.png",
          "Classic soft drink"),
           ProductModel(2, "Electronics", 'Italian', "20", "4", "assets/5a.png",
          "Classic soft drink"),
           ProductModel(2, "Drinks", 'Italian', "20", "4", "assets/5a.png",
          "Classic soft drink"),
           ProductModel(2, "Gadget", 'Italian', "20", "4", "assets/5a.png",
          "Classic soft drink"),
    ];
  }
}
