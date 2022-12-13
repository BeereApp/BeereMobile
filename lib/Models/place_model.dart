import 'dart:convert';

PlaceModel placeModelFromMap(String str) =>
    PlaceModel.fromMap(json.decode(str));

class PlaceModel {
  PlaceModel({
    required this.predictions,
    required this.status,
  });

  final List<Prediction> predictions;
  final String status;

  factory PlaceModel.fromMap(Map<String, dynamic> json) => PlaceModel(
        predictions: List<Prediction>.from(
            json["predictions"].map((x) => Prediction.fromMap(x))),
        status: json["status"],
      );
}

class Prediction {
  Prediction({
    required this.description,
    required this.placeId,
  });

  final String description;
  final String placeId;

  factory Prediction.fromMap(Map<String, dynamic> json) => Prediction(
        description: json["description"],
        placeId: json["place_id"],
      );
}
