import 'package:logindemo/business_logic/models/login/login_request.dart';
import 'package:logindemo/business_logic/models/login/login_response.dart';
import 'package:logindemo/data/services/login_service.dart';
import 'dart:convert' as convert;

class LoginRepository {
  final loginService = LoginService();

  Future<LoginResponse> login(String username, String password) async {

    LoginRequest request = LoginRequest(username: username, password: password);

    var requestData = convert.jsonEncode(request.toJson());

    var response = await loginService.login(body: requestData);

    var responseData = LoginResponse.fromJson(convert.jsonDecode(response));

    return responseData;
  }
}
