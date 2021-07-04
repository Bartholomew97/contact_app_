
import 'package:contact_app_null_safety/data/data_providers/contact_details_api.dart';
import 'package:contact_app_null_safety/data/models/contact_details.dart';
import 'package:http/http.dart';

class ContactDetailsRepository {

  ContactDetailsApi contactDetailsApi = ContactDetailsApi();

  ContactDetailsRepository({required this.contactDetailsApi});

  Future<Response> addContactDetails(
      String name,
      String lastname,
      String telephoneNumber,
      String email,
      String company,
      String companyAdress,
      String position,
      String positionEN
      ) async {
    Response response = await contactDetailsApi.addContactDetails(
        name,
        lastname,
        telephoneNumber,
        email,
        company,
        companyAdress,
        position,
        positionEN);
    return response;
  }

  Future<ContactDetails> fetchUserContactDetails() async {
    return await contactDetailsApi.fetchContactDetails();
  }
}