import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influlanceinsta/controller/AppController.dart';
import 'package:influlanceinsta/model/InfModel.dart';
import 'package:influlanceinsta/style/TextStyles.dart';
import 'package:influlanceinsta/view/ChartView.dart';
import 'package:influlanceinsta/widget/SizedSpace.dart';

Widget primaryCard(
    {InfModel data,
    String image,
    context,
    String title,
    String subtitle,
    String path,
    String followers,
    String name}) {
  return InkWell(
    onTap: () {
      AppController controller = Get.find();
      controller.selectModel(data);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChartView(),
          ));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 80,
          color: Color((math.Random().nextDouble() * 4 * 0xFFFFFF).toInt())
              .withOpacity(0.7),
          child: Column(
            children: [
              sizedSpace(),
              sizedSpace(),
              Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: image,
                      image:
                          "https://img-s1.onedio.com/id-596f4c24ae7582820e3b8d53/rev-0/w-900/h-507/f-jpg/s-c39d6f338657e68c750a57a5f9d005393ca44345.jpg",
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                style: cardTextStyleBold(),
              ),
              Text(
                subtitle,
                style: cardTextStyleNormal(),
              ),
              sizedSpace(),
              sizedSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Followers",
                        style: cardTextStyleNormal(),
                      ),
                      Text(
                        followers,
                        style: cardTextStyleBold(),
                      ),
                    ],
                  ),
                  sizedSpace(),
                  sizedSpace(),
                  Column(
                    children: [
                      Text(
                        "Quality Followers",
                        style: cardTextStyleNormal(),
                      ),
                      Text(
                        "430",
                        style: cardTextStyleBold(),
                      ),
                    ],
                  ),
                  /* Column(
                    children: [
                      Text(
                        "name",
                        style: cardTextStyleNormal(),
                      ),
                      Text(
                        name,
                        style: cardTextStyleBold(),
                      ),
                    ],
                  ),*/
                ],
              ),
              sizedSpace(),
            ],
          )),
    ),
  );
}

Widget secondaryCard() {
  return Center(
    child: Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 90,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: FadeInImage.assetNetwork(
                placeholder: "assets/logo.png",
                image: "http://asd.org/asd/d/pubslic/",
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        sizedSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kullanıcı Adı: ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "furkanansn",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        sizedSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Biyografi: ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "CS",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        sizedSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kategori: ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        sizedSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Onaylı Hesap: ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "Hayır",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        sizedSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Post Sayısı: ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "100",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        sizedSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Beğeni Sayısı: ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "100",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        sizedSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Takipçi Sayısı: ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "100",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        sizedSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Takip Edilen Sayısı: ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "100",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
      ],
    ),
  );
}

Widget chartCard(
    {String image, context, String title, String subtitle, String path}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, path);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Card(
          elevation: 30,
          child: Column(
            children: [
              ListTile(
                title: Text(title),
                trailing: Icon(Icons.arrow_forward_ios),
              )
            ],
          )),
    ),
  );
}
