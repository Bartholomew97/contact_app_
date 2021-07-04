import 'package:contact_app_null_safety/data/data_providers/AppUserApi.dart';
import 'package:http/http.dart';

class AppUserRepository {

  AppUserApi appUserApi = AppUserApi();

  AppUserRepository({required this.appUserApi});

  Future<Response> tryAuthorization(String username, String password) async {
    try {
      Response response = await appUserApi.attemptAuthorization(username, password);
      return response;
    } on Exception catch (e) {
      print(e.toString());
      return Response(e.toString(), 500);
    }
  }


  Future<Response> registerUser(String username, String password, String country) async {
    try {
      Response response = await appUserApi.registerUser(username, password, country);
      return response;
    } on Exception catch (e) {
      return Response(e.toString(), 500);
    }
  }
}