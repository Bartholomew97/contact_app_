
import 'package:contact_app_null_safety/security/TokenRepository.dart';
import 'package:http/http.dart' as http;

import '../../app_constans.dart';


class ContactCodeApi {

  Future<String> getContactCode() async {
    final response = await http.post(
      Uri.http(AppConstans.baseUrl, '/api/contactCode/create'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization' : await getToken()
      },
    );

    return response.body;
  }

  Future<http.Response> addContactWithCode(String codeValue) async {
    final response = await http.post(
      Uri.http(AppConstans.baseUrl, '/api/contacts/createContactWithCode', {"contactCodeValue": codeValue}),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': await getToken()
      },
    );

    return response;
  }
}