import 'dart:convert';

VendorLoginModel vendorLoginModelFromMap(String str) =>
    VendorLoginModel.fromMap(json.decode(str));

String vendorLoginModelToMap(VendorLoginModel data) =>
    json.encode(data.toMap());

class VendorLoginModel {
  VendorLoginModel({
    required this.message,
    required this.data,
    required this.status,
  });

  final String message;
  final Data data;
  final bool status;

  factory VendorLoginModel.fromMap(Map<String, dynamic> json) =>
      VendorLoginModel(
        message: json["message"],
        data: Data.fromMap(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data.toMap(),
        "status": status,
      };
}

class Data {
  Data({
    required this.token,
    required this.user,
  });

  final String token;
  final User user;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user": user.toMap(),
      };
}

class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.businessType,
    this.companyRegisteredName,
    this.companyAddress,
    this.companyPhone,
    this.tin,
    this.cacNumber,
    required this.isPhoneVerified,
    required this.isManufacturer,
    this.accountName,
    this.accountNumber,
    this.bankName,
    this.sellerId,
    required this.profileCompleted,
    required this.status,
  });

  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String businessType;
  final String? companyRegisteredName;
  final String? companyAddress;
  final String? tin;
  final String? cacNumber;
  final bool isPhoneVerified;
  final String? companyPhone;
  final bool isManufacturer;
  final String? accountName;
  final String? accountNumber;
  final String? bankName;
  final String? sellerId;
  final bool profileCompleted;
  final bool status;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        businessType: json["business_type"],
        companyRegisteredName: json["company_registered_name"],
        companyAddress: json["company_address"],
        tin: json["tin"],
        cacNumber: json["cac_number"],
        isPhoneVerified: json["is_phone_verified"] == '1' ? true : false,
        companyPhone: json["company_phone"],
        isManufacturer: json["is_manufacturer"] == '1' ? true : false,
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        bankName: json["bank_name"],
        sellerId: json["seller_id"],
        profileCompleted: json["profile_completed"] == '1' ? true : false,
        status: json["status"] == '1' ? true : false,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "business_type": businessType,
        "company_registered_name": companyRegisteredName,
        "company_address": companyAddress,
        "tin": tin,
        "cac_number": cacNumber,
        "is_phone_verified": isPhoneVerified,
        "company_phone": companyPhone,
        "is_manufacturer": isManufacturer,
        "account_name": accountName,
        "account_number": accountNumber,
        "bank_name": bankName,
        "seller_id": sellerId,
        "profile_completed": profileCompleted,
        "status": status,
      };
}
