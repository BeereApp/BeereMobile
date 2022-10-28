import 'dart:convert';

import 'package:beere_mobile/api/api_name.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/models/category_model.dart';
import 'package:beere_mobile/models/register_model.dart';
import 'package:beere_mobile/models/vendor_login_model.dart';
import 'package:beere_mobile/services/generic_http_response.dart';
import 'package:beere_mobile/services/http_client.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:flutter/material.dart';

class APIService {
  final HttpClientWrapper _http = HttpClientWrapper();

  ///Authentication
  Future<GenericHttpResponse> registerUser(dynamic body) async {
    final response = await _http.post(APIName.urlRegister, body: body);
    return response;
  }

  Future<bool> verifyPhone(dynamic body) async {
    final response = await _http.post(APIName.urlVerifyPhone, body: body);
    return response.body['status'] ?? false;
  }

  Future<GenericHttpResponse> login(dynamic body) async {
    final response = await _http.post(APIName.urlLogin, body: body);
    return response;
  }

  Future<VendorRegisterModel> registerVendor(dynamic body) async {
    final response = await _http.post(APIName.urlVendorRegister, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body);
    return vendorRegisterFromMap(data);
  }

  Future<bool> verifyVendor(dynamic body) async {
    final response = await _http.post(APIName.urlVendorVerifyPhone, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.body['status'] ?? false;
  }

  Future<bool> updateVendorInfo(dynamic body, {required String id}) async {
    final response =
        await _http.put('${APIName.urlUpdateVendorInfo}/$id', body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.body['status'] ?? false;
  }

  Future<VendorLoginModel> loginVendor(dynamic body) async {
    final response =
        await _http.post(APIName.urlVendorLogin, body: body).catchError((e) {
      debugPrint('Service: $e');
    });
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body);
    return vendorLoginModelFromMap(data);
  }

  Future<List<Category>> getCategories() async {
    final response = await _http.get(APIName.urlGetCategories);
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body['data']);
    return categoryFromMap(data);
  }

  Future<bool> forgotPassword(dynamic body) async {
    final response = await _http.post(
        usertype == UserType.user
            ? APIName.urlForgotPassword
            : APIName.urlVendorForgotPassword,
        body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.body['status'] ?? false;
  }

  Future<bool> resetPassword(dynamic body) async {
    final response = await _http.post(APIName.urlResetPassword, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.body['status'] ?? false;
  }
}
