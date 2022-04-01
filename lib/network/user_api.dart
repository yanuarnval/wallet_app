import 'dart:convert';

import 'package:technical_challange/model/user_model.dart';
import 'package:technical_challange/shared/url.dart';
import 'package:http/http.dart' as http;

class UserApi {
  final url = Url.url;

  Future<String> loginUser(String email, String Password) async {
    final loginUrl = url + '/login?email=$email&password=$Password';
    final request = await http.get(Uri.parse(loginUrl));
    Map<String, dynamic> body = jsonDecode(request.body);
    if (request.statusCode == 200 && body['message'] == 'success') {
      return email;
    } else {
      throw (body['message']);
    }
  }

  Future<UserModel> registeruser(
      String name, String email, String password) async {
    final registerurl = url + '/register';
    final request = await http.post(
      Uri.parse(registerurl),
      body: <String, String>{
        'name': name,
        'email': email,
        'password': password
      },
    );
    Map<String, dynamic> body = jsonDecode(request.body);
    print(body);
    if (request.statusCode == 200 && body['message'] == 'success') {
      final data = body['data'];
      return UserModel.fromJson(data);
    } else {
      throw (body['message']);
    }
  }
}
