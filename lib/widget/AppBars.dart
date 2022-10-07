import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influlanceinsta/controller/AppController.dart';
import 'package:influlanceinsta/style/TextStyles.dart';
Widget blankAppBar(){
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
Widget blankAppBarWithBackButton({String title}){
  return AppBar(
    title: (title == null) ? Text("") : Text(title,style: secondaryTextStyle(),),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    leading: BackButton(
      color: Colors.black,
    ),
  );
}
Widget primaryAppBar(String title){
  return AppBar(
    title: Text(title,style: secondaryTextStyle(),),
    centerTitle: true,
    backgroundColor: Colors.white,

  );
}
Widget secondaryAppbar(String title){
  AppController appController = Get.find();
  return AppBar(
    title: Text(title,style: secondaryTextStyle(),),
    centerTitle: true,
    backgroundColor: Colors.white,
    actions: [
      IconButton(icon: Icon(Icons.wrap_text,color: Colors.black,), onPressed: () {
      appController.showFilter.value = !appController.showFilter.value;
      },)
    ],

  );
}