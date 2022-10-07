import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LogicUtil{

  checkUser(context) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("id") == null){
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    }
    else{
      Navigator.pushNamedAndRemoveUntil(context, "/bottom", (route) => false);
    }
  }

}