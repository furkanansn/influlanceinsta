import 'package:flutter/material.dart';
import 'package:influlanceinsta/widget/AppBars.dart';
import 'package:influlanceinsta/widget/Card.dart';

class ChartView extends StatefulWidget {
  @override
  _ChartViewState createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: blankAppBarWithBackButton(title: "İstatistikler"),
      body: ListView(
        children: [
          chartCard(
              context: context,
              title: "Cinsiyet Grafiği",
              path: "/genderchart",
              subtitle: "",
              image: "assets/logo.png"),
          chartCard(
              context: context,
              title: "Yaş Grafiği",
              path: "/agechart",
              subtitle: "",
              image: "assets/logo.png"),
          chartCard(
              context: context,
              title: "Başarı Grafiği",
              path: "/egchart",
              subtitle: "",
              image: "assets/logo.png"),
        ],
      ),
    );
  }
}
