import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influlanceinsta/controller/AppController.dart';
import 'package:influlanceinsta/widget/AppBars.dart';

class AgeChartView extends StatefulWidget {
  @override
  _AgeChartViewState createState() => _AgeChartViewState();
}

class _AgeChartViewState extends State<AgeChartView> {
  AppController appController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: blankAppBarWithBackButton(title: "Yaş Grafiği"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (appController.loading.value == false) {
            return charts.PieChart(
                appController.createAgeData(appController.infModel),
                animate: true,
                defaultRenderer: new charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      new charts.ArcLabelDecorator(
                          labelPosition: charts.ArcLabelPosition.inside)
                    ]));
          }
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }),
      ),
    );
  }
}
