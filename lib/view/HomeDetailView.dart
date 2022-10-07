import 'package:flutter/material.dart';
import 'package:influlanceinsta/view/ChartView.dart';
import 'package:influlanceinsta/widget/AppBars.dart';

class HomeDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: blankAppBarWithBackButton(title: "İstatistikler"),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ChartView(),
          ),
        ),
      ),
    );
  }
}
