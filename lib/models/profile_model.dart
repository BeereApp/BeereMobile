import 'dart:convert';

VendorProfileModel vendorProfileModelFromMap(String str) =>
    VendorProfileModel.fromMap(json.decode(str));

String vendorProfileModelToMap(VendorProfileModel data) =>
    json.encode(data.toMap());

class VendorProfileModel {
  VendorProfileModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.businessType,
    required this.companyRegisteredName,
    required this.companyAddress,
    required this.companyPhone,
    this.tin,
    this.cacNumber,
    required this.isManufacturer,
    required this.accountName,
    required this.accountNumber,
    required this.bankName,
    required this.sellerId,
    required this.status,
    this.homeAddress,
    this.whatsapp,
    this.dateOfEstablishment,
    this.companyEmail,
    this.officePhone,
    this.personalImage,
    this.personalBackgroundImage,
    this.businessImage,
    this.businessBackgroundImage,
  });

  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String businessType;
  final String companyRegisteredName;
  final String companyAddress;
  final String companyPhone;
  final String? tin;
  final String? cacNumber;
  final bool isManufacturer;
  final String accountName;
  final String accountNumber;
  final String bankName;
  final String sellerId;
  final bool status;
  final String? homeAddress;
  final String? whatsapp;
  final DateTime? dateOfEstablishment;
  final String? companyEmail;
  final String? officePhone;
  final String? personalImage;
  final String? personalBackgroundImage;
  final String? businessImage;
  final String? businessBackgroundImage;

  factory VendorProfileModel.fromMap(Map<String, dynamic> json) =>
      VendorProfileModel(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        businessType: json["business_type"],
        companyRegisteredName: json["company_registered_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"] ?? '',
        tin: json["tin"],
        cacNumber: json["cac_number"],
        isManufacturer:
            json["is_manufacturer"].toString() == '1' ? true : false,
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        bankName: json["bank_name"],
        sellerId: json["seller_id"],
        status: json["status"].toString() == '1' ? true : false,
        homeAddress: json["home_address"],
        whatsapp: json["whatsapp"],
        dateOfEstablishment: json["date_of_establishment"] == null
            ? null
            : DateTime.parse(json["date_of_establishment"]).toLocal(),
        companyEmail: json["company_email"],
        officePhone: json["office_phone"],
        personalImage: json["personal_image"],
        personalBackgroundImage: json["personal_background_image"],
        businessImage: json["business_image"],
        businessBackgroundImage: json["business_background_image"],
      );

  Map<String, String> toMap() => {
        //"id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "business_type": businessType,
        "company_registered_name": companyRegisteredName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "tin": tin.toString(),
        "cac_number": cacNumber.toString(),
        //"is_manufacturer": isManufacturer,
        "account_name": accountName,
        "account_number": accountNumber,
        "bank_name": bankName,
        "seller_id": sellerId,
        //"status": status,
        if (homeAddress != null) "home_address": homeAddress!,
        if (whatsapp != null) "whatsapp": whatsapp!,
        if (dateOfEstablishment != null)
          "date_of_establishment":
              dateOfEstablishment!.toUtc().toIso8601String(),
        if (companyEmail != null) "company_email": companyEmail!,
        if (officePhone != null) "office_phone": officePhone!,
        // "personal_image": personalImage,
        // "personal_background_image": personalBackgroundImage,
        // "business_image": businessImage,
        // "business_background_image": businessBackgroundImage,
      };

  VendorProfileModel copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? businessType,
    String? companyRegisteredName,
    String? companyAddress,
    String? companyPhone,
    String? tin,
    String? cacNumber,
    bool? isManufacturer,
    String? accountName,
    String? accountNumber,
    String? bankName,
    String? sellerId,
    bool? status,
    String? homeAddress,
    String? whatsapp,
    DateTime? dateOfEstablishment,
    String? companyEmail,
    String? officePhone,
    String? personalImage,
    String? personalBackgroundImage,
    String? businessImage,
    String? businessBackgroundImage,
  }) {
    return VendorProfileModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      businessType: businessType ?? this.businessType,
      companyRegisteredName:
          companyRegisteredName ?? this.companyRegisteredName,
      companyAddress: companyAddress ?? this.companyAddress,
      companyPhone: companyPhone ?? this.companyPhone,
      tin: tin ?? this.tin,
      cacNumber: cacNumber ?? this.cacNumber,
      isManufacturer: isManufacturer ?? this.isManufacturer,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      bankName: bankName ?? this.bankName,
      sellerId: sellerId ?? this.sellerId,
      status: status ?? this.status,
      homeAddress: homeAddress ?? this.homeAddress,
      whatsapp: whatsapp ?? this.whatsapp,
      dateOfEstablishment: dateOfEstablishment ?? this.dateOfEstablishment,
      companyEmail: companyEmail ?? this.companyEmail,
      officePhone: officePhone ?? this.officePhone,
      personalImage: personalImage ?? this.personalImage,
      personalBackgroundImage:
          personalBackgroundImage ?? this.personalBackgroundImage,
      businessImage: businessImage ?? this.businessImage,
      businessBackgroundImage:
          businessBackgroundImage ?? this.businessBackgroundImage,
    );
  }
}
