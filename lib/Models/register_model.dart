import 'dart:convert';

VendorRegisterModel vendorRegisterFromMap(String str) =>
    VendorRegisterModel.fromMap(json.decode(str));

String vendorRegisterToMap(VendorRegisterModel data) =>
    json.encode(data.toMap());

class VendorRegisterModel {
  VendorRegisterModel({
    required this.data,
    required this.message,
    required this.status,
    required this.token,
  });

  final Data data;
  final String message;
  final bool status;
  final String token;

  factory VendorRegisterModel.fromMap(Map<String, dynamic> json) =>
      VendorRegisterModel(
        data: Data.fromMap(json["data"]),
        message: json["message"],
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
        "message": message,
        "status": status,
        "token": token,
      };
}

class Data {
  Data({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.businessType,
    required this.id,
  });

  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String businessType;
  final int id;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        businessType: json["business_type"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "business_type": businessType,
        "id": id,
      };
}

UserRegisterModel userRegisterModelFromMap(String str) =>
    UserRegisterModel.fromMap(json.decode(str));

class UserRegisterModel {
  UserRegisterModel({
    required this.token,
    required this.user,
  });

  final String token;
  final User user;

  factory UserRegisterModel.fromMap(Map<String, dynamic> json) =>
      UserRegisterModel(
        token: json["token"],
        user: User.fromMap(json["user"]),
      );
}

class User {
  User({
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.email,
    required this.age,
    required this.phone,
    required this.state,
    required this.lga,
    required this.id,
  });

  final String firstname;
  final String lastname;
  final String gender;
  final String email;
  final String age;
  final String phone;
  final String state;
  final String lga;
  final int id;

  factory User.fromMap(Map<String, dynamic> json) => User(
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        email: json["email"],
        age: json["age"],
        phone: json["phone"],
        state: json["state"],
        lga: json["lga"],
        id: json["id"],
      );
}
