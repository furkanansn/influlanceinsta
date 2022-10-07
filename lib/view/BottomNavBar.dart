import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influlanceinsta/controller/AppController.dart';
import 'package:influlanceinsta/view/HomeView.dart';
import 'package:influlanceinsta/view/SettingsView.dart';
import 'package:influlanceinsta/widget/AppBars.dart';

class SpecialBottomNavBar extends StatefulWidget {
  @override
  _SpecialBottomNavBarState createState() => _SpecialBottomNavBarState();
}

class _SpecialBottomNavBarState extends State<SpecialBottomNavBar> {
  int _currentIndex = 0;
  String title = "Influencer";
  AppController appController = Get.put(AppController());
  @override
  void initState() {
    appController.init();
    super.initState();
  }

  void _onTabChanged(int index) {
    this.setState(() {
      _currentIndex = index;
      if (index == 0) {
        title = "Influencer";
      }
      /*else if(index == 1){
          title = "Grafikler";
        }*/
      else {
        title = "Ayarlar";
      }
    });
  }

  List<Widget> _tabWidgets = [
    HomeView(),
    //ChartView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _currentIndex == 0 ? secondaryAppbar(title) : primaryAppBar(title),
      backgroundColor: Colors.white,
      body: _tabWidgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedLabelStyle: TextStyle(color: Colors.white),
        elevation: 1,
        iconSize: 25,
        currentIndex: _currentIndex,
        onTap: (index) {
          this._onTabChanged(index);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: "",
            icon: Icon(CupertinoIcons.home),
          ),
          /*BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: "",
            icon: Icon(CupertinoIcons.doc_append),
          ),*/
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: "",
            icon: Icon(CupertinoIcons.settings),
          ),
        ],
      ),
    );
  }
}
