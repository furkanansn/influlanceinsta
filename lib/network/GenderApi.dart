import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:influlanceinsta/model/GenderAndAgeModel.dart';
import 'package:influlanceinsta/network/AuthApi.dart';
import 'package:influlanceinsta/util/Static.dart';

class GenderApi{
  
  Future<GenderAndAgeModel> getGenders() async{
    final response = await http.get(Uri.parse(Base_Url + "/api/gender"),
    headers: await AuthApi().getToken());
    return GenderAndAgeModel.fromJson(jsonDecode(response.body));
  }

  /*Future<GenderAndAgeModel> getOneGenders({String username}) async{
    final response = await http.get(Uri.parse(Base_Url + "/api/gender/" + username));
    return GenderAndAgeModel.fromJson(jsonDecode(response.body));
  }*/
}