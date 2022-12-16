import 'dart:convert';
import 'dart:io';

import 'package:beere_mobile/api/api_name.dart';
import 'package:beere_mobile/helpers.dart';
import 'package:beere_mobile/models/category_model.dart';
import 'package:beere_mobile/models/location_model.dart';
import 'package:beere_mobile/models/login_model.dart';
import 'package:beere_mobile/models/place_model.dart';
import 'package:beere_mobile/models/profile_model.dart';
import 'package:beere_mobile/models/promotion_model.dart';
import 'package:beere_mobile/models/register_model.dart';
import 'package:beere_mobile/models/state_model.dart';
import 'package:beere_mobile/services/http_client.dart';
import 'package:beere_mobile/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class APIService {
  final HttpClientWrapper _http = HttpClientWrapper();

  ///Authentication
  Future<UserRegisterModel> registerUser(dynamic body) async {
    final response = await _http.post(APIName.urlRegister, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body['data']);
    return userRegisterModelFromMap(data);
  }

  Future<bool> verifyUser(dynamic body) async {
    final response = await _http.post(APIName.urlVerifyPhone, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    if (response.body['status'] == null) return response.status == 200;
    return response.body['status'] ?? response.body['success'] ?? false;
  }

  Future<UserLoginModel> loginUser(dynamic body) async {
    final response = await _http.post(APIName.urlLogin, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body['data']);
    return userLoginModelFromMap(data);
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
    return response.body['status'] ?? response.body['success'] ?? false;
  }

  Future<bool> updateVendorInfo(dynamic body, {required String id}) async {
    final response =
        await _http.put('${APIName.urlUpdateVendorInfo}/$id', body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.body['status'] ?? response.body['success'] ?? false;
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
    return response.body['status'] ?? response.body['success'] ?? false;
  }

  Future<bool> resetPassword(dynamic body) async {
    final response = await _http.post(APIName.urlResetPassword, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.body['status'] ?? response.body['success'] ?? false;
  }

  Future<VendorProfileModel> getVendorProfile() async {
    final response = await _http.get(APIName.urlGetVendorProfile);
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body['data']);
    return vendorProfileModelFromMap(data);
  }

  Future<List<StateModel>> getStates() async {
    final jsonString = await rootBundle.loadString('assets/states.json');
    return stateModelFromMap(jsonString);
  }

  Future<Map<String, dynamic>> addLocation(dynamic body) async {
    final response = await _http.post(APIName.urlAddLocation, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    Map<String, dynamic> output = {};
    output['status'] =
        response.body['status'] ?? response.body['success'] ?? false;
    output['id'] = response.body['data']['id'];
    return output;
  }

  Future<bool> updateLocation(dynamic body, int id) async {
    final response =
        await _http.put('${APIName.urlUpdateLocation}/$id', body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.body['status'] ?? response.body['success'] ?? false;
  }

  Future<List<LocationModel>> getLocations() async {
    final response = await _http.get(APIName.urlGetLocations);
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body['data']);
    return locationModelFromMap(data);
  }

  Future<bool> updateVendorProfile(dynamic body, dynamic files,
      {required String id}) async {
    final GetStorage box = GetStorage();
    final url = HttpClientWrapper.apiUrl(
        '${APIName.urlUpdateVendorProfile}/$id', {'_method': 'PUT'});
    final request = http.MultipartRequest('POST', Uri.parse(url));
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer ${box.read('token')}',
    };
    request
      ..headers.addAll(headers)
      ..files.addAll(files)
      ..fields.addAll(body);
    debugPrint('Url: $url');
    debugPrint('REQUEST FIELDS: ${request.fields}');
    debugPrint('REQUEST IMAGES: ${request.files}');
    final response = await request.send();
    debugPrint('STATUS CODE: ${response.statusCode}');
    debugPrint('MESSAGE: ${response.reasonPhrase}');
    debugPrint('SUCCESS: ${response.statusCode == 200}');
    debugPrint(
        'RESPONSE BODY: ${jsonDecode(await response.stream.bytesToString())}');

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }
    return response.statusCode == 200;
  }

  Future<PlaceModel> findPlaces(dynamic params) async {
    const url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    final uri = Uri.parse(url).replace(queryParameters: params);
    debugPrint('Url: $uri');
    final response = await http.get(uri);
    debugPrint('STATUS CODE: ${response.statusCode}');
    debugPrint('MESSAGE: ${response.reasonPhrase}');
    debugPrint('SUCCESS: ${response.statusCode == 200}');
    debugPrint('RESPONSE BODY: ${jsonDecode(response.body)}');
    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }
    return placeModelFromMap(response.body);
  }

  Future<List<PromotionModel>> getPromotions() async {
    final response = await _http.get(APIName.urlGetPromotions);
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body['data']);
    return promotionModelFromMap(data);
  }

  Future<PromotionModel> clickPromotion(dynamic params) async {
    final response =
        await _http.get(APIName.urlClickPromotion, queryParams: params);
    if (!response.success) {
      throw Exception(response.message);
    }
    return PromotionModel.fromMap(response.body['data']);
  }

  Future<List<PromotionModel>> getVendorPromotions() async {
    final response = await _http.get(APIName.urlGetVendorPromotions);
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body['data']);
    return promotionModelFromMap(data);
  }

  Future<bool> addPromotion(dynamic body, dynamic files) async {
    final GetStorage box = GetStorage();
    final url = HttpClientWrapper.apiUrl(APIName.urlAddVendorPromotion, null);
    final request = http.MultipartRequest('POST', Uri.parse(url));
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer ${box.read('token')}',
    };
    request
      ..headers.addAll(headers)
      ..files.addAll(files)
      ..fields.addAll(body);
    debugPrint('Url: $url');
    debugPrint('REQUEST FIELDS: ${request.fields}');
    debugPrint('REQUEST IMAGES: ${request.files}');
    final response = await request.send();
    debugPrint('STATUS CODE: ${response.statusCode}');
    debugPrint('MESSAGE: ${response.reasonPhrase}');
    debugPrint('SUCCESS: ${response.statusCode == 200}');
    debugPrint(
        'RESPONSE BODY: ${jsonDecode(await response.stream.bytesToString())}');

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }
    return response.statusCode == 200;
  }

  Future<List<PromotionModel>> getPromotionClicks() async {
    final response = await _http.get(APIName.urlGetPromotionClicks);
    if (!response.success) {
      throw Exception(response.message);
    }
    String data = jsonEncode(response.body['data']);
    return promotionModelFromMap(data);
  }

  Future<bool> search(dynamic body) async {
    final response = await _http.post(APIName.urlSearch, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.body['status'] ?? response.body['success'] ?? false;
  }
}
