import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logindemo/constants.dart';

class LoginService {
   Future<String> login({String body}) async {
    final String url = Constants.SERVER+'Auth/login';
    final response = await http.post('$url',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: ''
        },
        body: body);

    if (response.statusCode <= 200 || response.statusCode >= 400) {
      var result = response.body;
      return (result);
    } else {
      return throw Exception('Unable to connect with server');
    }
  }
}
