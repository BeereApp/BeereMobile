import 'dart:convert';

List<LocationModel> locationModelFromMap(String str) =>
    List<LocationModel>.from(
        json.decode(str).map((x) => LocationModel.fromMap(x)));

String locationModelToMap(List<LocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class LocationModel {
  LocationModel({
    required this.id,
    required this.email,
    required this.state,
    required this.lga,
    required this.whatsappContact,
    required this.officeAddress,
    required this.lat,
    required this.lng,
    required this.isDefault,
    this.homeAddress,
    this.otherContact,
  });

  final int id;
  final String email;
  final String state;
  final String lga;
  final String whatsappContact;
  final String officeAddress;
  final double lat;
  final double lng;
  final bool isDefault;
  final String? homeAddress;
  final String? otherContact;

  factory LocationModel.fromMap(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        email: json["email"],
        state: json["state"],
        lga: json["lga"],
        whatsappContact: json["whatsapp_contact"],
        officeAddress: json["office_address"],
        lat: double.parse(json["lat"].toString()),
        lng: double.parse(json["lng"].toString()),
        isDefault: json["is_default"].toString() == '1' ? true : false,
        homeAddress: json["Home_address"],
        otherContact: json["other_contact"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "state": state,
        "lga": lga,
        "whatsapp_contact": whatsappContact,
        "office_address": officeAddress,
        "Home_address": homeAddress,
        "other_contact": otherContact,
        "lat": lat,
        "lng": lng,
      };
}
