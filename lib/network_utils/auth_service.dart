import 'dart:convert';
import 'dart:io';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'dart:io';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:beere/network_utils/generic_response.dart';
import 'package:beere/network_utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum RequestType { get, post, patch, put, delete }

class CallApi {
  static String baseURL = 'https://beereapp.edusmart.ng/api';

  static Uri apiUrl(String path, Map<String, dynamic>? queryParams) {
    String uri = '$baseURL/$path';
    return Uri.parse(uri).replace(queryParameters: queryParams);
  }

  Map<String, String>? _header(String? token) {
    if (token != null) {
      return {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      };
    }
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  }

  Future<GenericResponse> _executeRequest(RequestType requestType, String path,
      {String? token, Map<String, dynamic>? queryParams, dynamic body}) async {
    http.Response httpResponse;
    GenericResponse response = GenericResponse();
    try {
      debugPrint('Url: ${apiUrl(path, queryParams)}');
      if (body != null) debugPrint('Body: $body');
      body = jsonEncode(body);
      switch (requestType) {
        case RequestType.get:
          httpResponse = await http.get(apiUrl(path, queryParams),
              headers: _header(token));
          break;
        case RequestType.post:
          httpResponse = await http.post(apiUrl(path, queryParams),
              body: body, headers: _header(token));
          break;
        case RequestType.put:
          httpResponse = await http.put(apiUrl(path, queryParams),
              body: body, headers: _header(token));
          break;
        case RequestType.patch:
          httpResponse = await http.patch(apiUrl(path, queryParams),
              body: body, headers: _header(token));
          break;
        case RequestType.delete:
          httpResponse = await http.delete(apiUrl(path, queryParams),
              body: body, headers: _header(token));
          break;
        default:
          httpResponse = await http.get(apiUrl(path, queryParams),
              headers: _header(token));
          break;
      }
      response.success = true;
      response.body = jsonDecode(httpResponse.body);
      response.status = httpResponse.statusCode;
      return response;
    } on SocketException {
      //When internet connection fails
      response.message = 'Internet connection failed';
      response.success = false;
      return response;
    } on FormatException {
      response.message = 'Bad format';
      response.success = false;
      return response;
    } catch (e) {
      debugPrint(e.toString());
      response.success = false;
      return response;
    }
  }

//Get Request
  Future<GenericResponse> getRequest(String path,
      {String? token, Map<String, dynamic>? queryParams}) async {
    return await _executeRequest(RequestType.get, path,
        token: token, queryParams: queryParams);
  }

//Post Request
  Future<GenericResponse> registerUser(String path,
      {dynamic body, String? token, Map<String, dynamic>? queryParams}) async {
    return await _executeRequest(RequestType.post, path,
        token: token, queryParams: queryParams, body: body);
  }
   Future<GenericResponse> registerOtp(String path,
      {dynamic body, String? token, Map<String, dynamic>? queryParams}) async {
    return await _executeRequest(RequestType.post, path,
        token: token, queryParams: queryParams, body: body);
  }


//Put Request
  Future<GenericResponse> putRequest(String path,
      {dynamic body, String? token, Map<String, dynamic>? queryParams}) async {
    return await _executeRequest(RequestType.put, path,
        token: token, queryParams: queryParams, body: body);
  }

  //Patch Request
  Future<GenericResponse> patchRequest(String path,
      {dynamic body, String? token, Map<String, dynamic>? queryParams}) async {
    return await _executeRequest(RequestType.patch, path,
        token: token, queryParams: queryParams, body: body);
  }

  //Delete Request
  Future<GenericResponse> deleteRequest(String path,
      {dynamic body, String? token, Map<String, dynamic>? queryParams}) async {
    return await _executeRequest(RequestType.delete, path,
        token: token, queryParams: queryParams, body: body);
  }





  postData(data, apiUrl) async {
    var fullUrl = baseURL + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = Uri.parse(baseURL + apiUrl);
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}

class AuthServices {
  static Future<http.Response> register(
      String fname,
      String lname,
      String email,
      String phone,
      String age,
      String gender,
      String password,
      String cPassword) async {
    Map data = {
      "first name": fname,
      "last name": lname,
      "email": email,
      "phone": phone,
      "age": age,
      "gender": gender,
      "password": password,
      "confirm": cPassword,
    };
    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + 'register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {"email": email, "password": password};
    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
