
import 'dart:convert';

import 'package:contact_app_null_safety/app_constans.dart';
import 'package:contact_app_null_safety/security/TokenRepository.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AppUserApi {

  Future<Response> attemptAuthorization(String username, String password) async {

    final response = await http.post(
      Uri.http(AppConstans.baseUrl, "/login", {"username": username, "password": password} ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    await saveToken(response.headers['authorization']!);
    return response;
  }

  Future<Response> registerUser(String username, String password, String country) async {
    final response = await http.post(
        Uri.http(AppConstans.baseUrl, "/api/users/add"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String> {
          'username': username,
          'password': password,
          'country': country
        })
    );
    return response;
  }
}