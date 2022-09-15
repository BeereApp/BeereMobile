import 'package:beere_mobile/api/api_name.dart';
import 'package:beere_mobile/services/generic_http_response.dart';
import 'package:beere_mobile/services/http_client.dart';

class APIService{
  final HttpClientWrapper _http = HttpClientWrapper();

  ///Authentication
  Future<GenericHttpResponse> registerUser(dynamic body)async{
    final response = await _http.post(APIName.urlRegister,body: body);
    return response;
  }

  Future<GenericHttpResponse> verifyPhone(dynamic body)async{
    final response = await _http.post(APIName.urlVerifyPhone,body: body);
    return response;
  }

  Future<GenericHttpResponse> login(dynamic body)async{
    final response = await _http.post(APIName.urlLogin,body: body);
    return response;
  }
}