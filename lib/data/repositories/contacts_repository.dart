
import 'package:contact_app_null_safety/data/data_providers/contacts_api.dart';
import 'package:contact_app_null_safety/data/models/contact.dart';
import 'package:http/http.dart';


class ContactsRepository {

  ContactsApi? contactsApi = ContactsApi();

  ContactsRepository({this.contactsApi});

  Future<List<Contact>> fetchContacts() async {
    List<Contact> contacts = await contactsApi!.fetchContacts();
    return contacts;
  }

  Future<Response> changeFavourite(String contactId) async {
    Response response = await contactsApi!.changeFavourite(contactId);
    return response;
  }

  Future<Response> changeHide(String contactId) async {
    Response response = await contactsApi!.changeHide(contactId);
    return response;
  }
}