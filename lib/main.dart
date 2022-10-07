import 'package:flutter/material.dart';
import 'package:influlanceinsta/view/AgeChartView.dart';
import 'package:influlanceinsta/view/BottomNavBar.dart';
import 'package:influlanceinsta/view/ChangePasswordView.dart';
import 'package:influlanceinsta/view/ChangeUserNameView.dart';
import 'package:influlanceinsta/view/ChartView.dart';
import 'package:influlanceinsta/view/EngagementRateChartView.dart';
import 'package:influlanceinsta/view/GenderChart.dart';
import 'package:influlanceinsta/view/HomeDetailView.dart';
import 'package:influlanceinsta/view/LogicView.dart';
import 'package:influlanceinsta/view/LoginView.dart';
import 'package:influlanceinsta/view/RegisterView.dart';
import 'package:influlanceinsta/view/SettingsView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Influlance Insta",
      initialRoute: "/logic",
      routes: {
        "/logic" : (_) => LogicView(),
        "/login" : (_) => LoginView(),
        "/register" : (_) => RegisterView(),
        "/bottom" : (_) => SpecialBottomNavBar(),
        "/homedetail" : (_) => HomeDetailView(),
        "/setting" : (_) => SettingsView(),
        "/chart" : (_) => ChartView(),
        "/genderchart" : (_) => GenderChart(),
        "/agechart" : (_) => AgeChartView(),
        "/egchart" : (_) => EngagementRateChartView(),
        "/changeusername" : (_) => ChangeUsernameView(),
        "/changepassword" : (_) => ChangePasswordView(),
      },
    );
  }
}
