import 'dart:convert';

List<PromotionModel> promotionModelFromMap(String str) =>
    List<PromotionModel>.from(
        json.decode(str).map((x) => PromotionModel.fromMap(x)));

String promotionModelToMap(List<PromotionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PromotionModel {
  PromotionModel({
    required this.id,
    required this.productName,
    required this.productType,
    required this.location,
    required this.price,
    required this.discount,
    required this.productImage,
    required this.description,
    required this.promotionStarts,
    required this.promotionEnds,
    required this.isApproved,
    required this.categoryId,
    required this.vendorId,
    required this.clicks,
  });

  final int id;
  final String productName;
  final String productType;
  final String location;
  final double price;
  final double discount;
  final String productImage;
  final String description;
  final DateTime promotionStarts;
  final DateTime promotionEnds;
  final bool isApproved;
  final String categoryId;
  final String vendorId;
  final int clicks;

  factory PromotionModel.fromMap(Map<String, dynamic> json) => PromotionModel(
        id: json["id"],
        productName: json["product_name"],
        productType: json["product_type"],
        location: json["location"],
        price: double.tryParse(json["price_range"].toString()) ?? 0,
        discount: double.tryParse(json["discount_price"].toString()) ?? 0,
        productImage: (json["product_image"] as String).contains('https')
            ? json['product_image']
            : 'https://beereapp.edusmart.ng/storage/uploads/${json['product_image']}',
        description: json["description"],
        promotionStarts: DateTime.parse(json["promotion_starts"]).toLocal(),
        promotionEnds: DateTime.parse(json["promotion_ends"]).toLocal(),
        isApproved: json["is_approved"].toString() == '1' ? true : false,
        categoryId: json["category_id"].toString(),
        vendorId: json["vendor_id"].toString(),
        clicks: json["count"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "product_name": productName,
        "product_type": productType,
        "location": location,
        "price_range": price,
        "discount_price": discount,
        "product_image": productImage,
        "description": description,
        "promotion_starts": promotionStarts.toUtc().toIso8601String(),
        "promotion_ends": promotionEnds.toUtc().toIso8601String(),
        "category_id": categoryId,
        "vendor_id": vendorId,
        "count": clicks,
      };
}
