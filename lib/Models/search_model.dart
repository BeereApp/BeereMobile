import 'dart:convert';

import 'package:beere_mobile/models/location_model.dart';
import 'package:beere_mobile/models/profile_model.dart';

List<SearchModel> searchModelFromMap(String str) =>
    List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromMap(x)));

class SearchModel {
  SearchModel({
    required this.location,
    required this.vendor,
    this.selected = false,
  });

  final LocationModel location;
  final VendorProfileModel vendor;
  final bool selected;

  factory SearchModel.fromMap(Map<String, dynamic> json) => SearchModel(
        location: LocationModel.fromMap(json),
        vendor: VendorProfileModel.fromMap(json["vendor"]),
      );

  SearchModel copyWith({
    LocationModel? location,
    VendorProfileModel? vendor,
    bool? selected,
  }) =>
      SearchModel(
        location: location ?? this.location,
        vendor: vendor ?? this.vendor,
        selected: selected ?? this.selected,
      );
}
