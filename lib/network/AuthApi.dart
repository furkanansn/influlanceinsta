import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:influlanceinsta/model/GeneralModel.dart';
import 'package:influlanceinsta/model/RegisterResponse.dart';
import 'package:influlanceinsta/model/TokenResponse.dart';
import 'package:influlanceinsta/util/Static.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  Future<dynamic> getToken() async {
    final response = await http.post(Uri.parse(Base_Url + "/api/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": "test@gmail.com", "password": "test12345"}));
    TokenResponse tokenResponse =
        TokenResponse.fromJson(jsonDecode(response.body));
    return {
      "Authorization": "Bearer " + tokenResponse.token,
      "Content-Type": "application/json"
    };
  }

  Future<GeneralModel> register(
      {String email, String password, String name, String surname}) async {
    final response = await http.post(Uri.parse(Base_Url + "/api/user/register"),
        headers: await getToken(),
        body: jsonEncode({
          "email": email,
          "password": password,
          "name": name,
          "surname": surname
        }));
    if (response.statusCode != 200) {
      return new GeneralModel.name(
          false, null, jsonDecode(response.body)['message']);
    }
    GeneralModel generalModel = new GeneralModel();
    generalModel.success = true;
    generalModel.data = RegisterResponse.fromJson(jsonDecode(response.body));
    generalModel.errorMessage = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("id", generalModel.data.id);
    return generalModel;
  }

  Future<GeneralModel> login({String email, String password}) async {
    final response = await http.post(Uri.parse(Base_Url + "/api/user/login"),
        headers: await getToken(),
        body: jsonEncode({"email": email, "password": password}));
    if (response.statusCode != 200) {
      return new GeneralModel.name(false, null,
          "Yanlış bir e-posta ya da parola girdiniz. Lütfen tekrar deneyiniz.");
    }
    GeneralModel generalModel = new GeneralModel();
    generalModel.success = true;
    generalModel.errorMessage = null;
    generalModel.data = RegisterResponse.fromJson(jsonDecode(response.body));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("id", generalModel.data.id);
    return generalModel;
  }
}
