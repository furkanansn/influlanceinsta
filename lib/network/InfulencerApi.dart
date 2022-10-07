import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:influlanceinsta/model/InfModel.dart';
import 'package:influlanceinsta/network/AuthApi.dart';
import 'package:influlanceinsta/util/Static.dart';

class InfulencerApi {
  Future<List<InfModel>> getInfulencers() async {
    final response = await http.get(Uri.parse(Base_Url + "/api/inf"),
        headers: await AuthApi().getToken());

    return (jsonDecode(response.body) as List)
        .map((e) => InfModel.fromJson(e))
        .toList();
  }
}
