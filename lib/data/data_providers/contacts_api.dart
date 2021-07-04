
import 'dart:convert';

import 'package:contact_app_null_safety/data/models/contact.dart';
import 'package:contact_app_null_safety/security/TokenRepository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../app_constans.dart';


class ContactsApi {

  final http.Client? httpClient;


  ContactsApi({this.httpClient});

  Future<List<Contact>> fetchContacts() async {

    final response = await httpClient!.get(
        Uri.http(AppConstans.baseUrl, "/api/contacts/findUserContacts"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': await getToken()
        });

    return compute(parseContacts, utf8.decode(response.bodyBytes));
  }

  Future<Response> changeFavourite(String contactId) async {

    final response = await http.patch(
      Uri.http(AppConstans.baseUrl, "/api/contacts/changeFavourite", {"contactId": contactId}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization' : await getToken()
      },
    );

    return response;
  }

  Future<Response> changeHide(String contactId) async {

    final response = await http.patch(
      Uri.http(AppConstans.baseUrl, "/api/contacts/changeHide", {"contactId": contactId}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization' : await getToken()
      },
    );
    return response;

  }
}

List<Contact> parseContacts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Contact>((json) => Contact.fromJson(json)).toList();
}