import 'dart:developer';

import 'package:http/http.dart' as http;

class ExampleInstagramApi{
  Future<String> exampleInstagramApi() async{
    final response = await http.get(Uri.parse("https://www.instagram.com/hilmicantas/?__a=1"));
    return response.body.toString();
  }
}