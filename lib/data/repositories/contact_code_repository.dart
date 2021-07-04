
import 'dart:async';

import 'package:contact_app_null_safety/data/data_providers/contact_code_api.dart';
import 'package:http/http.dart';

class ContactCodeRepository {
  ContactCodeApi? contactCodeApi;

  ContactCodeRepository({this.contactCodeApi});

  Future<String> getContactCode() async {
    String codeValue =  await contactCodeApi!.getContactCode();

    if(codeValue.length == 6) {
      return codeValue;
    } else {
      return '';
    }
  }

  Future<Response> addContactWithContactCode(String codeValue) async {
    return await contactCodeApi!.addContactWithCode(codeValue);
  }

}