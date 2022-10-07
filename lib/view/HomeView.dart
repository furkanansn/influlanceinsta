import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influlanceinsta/controller/AppController.dart';
import 'package:influlanceinsta/widget/Card.dart';
import 'package:influlanceinsta/widget/SizedSpace.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(
        shrinkWrap: true,
        children: [
          appController.showFilter.value == true
              ? filterGenerator()
              : Container(),
          ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: appController.data.value.length,
              itemBuilder: (context, index) {
                if (appController.data.value.length > 0) {
                  return Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: primaryCard(
                        data: appController.data.value[index],
                        context: context,
                        title: appController.data.value[index].name,
                        subtitle:
                            "@" + appController.data.value[index].username,
                        path: "/homedetail",
                        followers:
                            appController.data.value[index].follower.toString(),
                        name: appController.data.value[index].name,
                        image: "assets/logo.png"),
                  );
                }
                return CupertinoActivityIndicator();
              })
        ],
      );
    });
  }

  Widget filterGenerator() {
    final List<String> city = [
      "Influencer'ın şehri",
      'İstanbul',
      'Ankara',
      'İzmir',
      'Aydın'
    ];
    final List<String> age = [
      "Influencer'ın yaşı",
      '18-25',
      '25-30',
      '35-40',
      '>40'
    ];
    final List<String> gender = [
      "Influencer'ın cinsiyeti",
      "Erkek",
      "Kadın",
      "Farketmez"
    ];
    final List<String> followers = [
      "Influencer'ın takipçi sayısı",
      "<1M",
      ">1M",
      ">2M",
      ">3M",
      ">4M"
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: DropdownButtonFormField(
            value: "Influencer'ın şehri",
            items: city.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              log(value);
            },
          ),
        ),
        sizedSpace(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: DropdownButtonFormField(
            value: "Influencer'ın yaşı",
            items: age.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              log(value);
            },
          ),
        ),
        sizedSpace(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: DropdownButtonFormField(
            value: "Influencer'ın cinsiyeti",
            items: gender.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              log(value);
            },
          ),
        ),
        sizedSpace(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: DropdownButtonFormField(
            value: "Influencer'ın takipçi sayısı",
            items: followers.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              log(value);
            },
          ),
        ),
        sizedSpace(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: CupertinoButton.filled(
            child: Text("Filtrele"),
            onPressed: () {},
          ),
        ),
        sizedSpace(),
      ],
    );
  }
}
