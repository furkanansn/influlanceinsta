import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:influlanceinsta/model/ExampleChartModel.dart';
import 'package:influlanceinsta/model/InfModel.dart';
import 'package:influlanceinsta/network/InfulencerApi.dart';
import 'package:influlanceinsta/util/Logger.dart';

class AppController extends GetxController {
  var data = [].obs;
  var showFilter = false.obs;
  var loading = false.obs;
  var infModel;
  init() async {
    loading.value = true;
    List<InfModel> infModel = await InfulencerApi().getInfulencers();
    data.value = infModel;
    logger.d(infModel);
    loading.value = false;
  }

  selectModel(InfModel m) {
    infModel = m;
  }

  List<charts.Series<ExampleModel, String>> createGenderData(InfModel value) {
    final data = [
      new ExampleModel('Erkek', value.genderM),
      new ExampleModel('Kadın', value.genderF)
    ];

    return [
      new charts.Series<ExampleModel, String>(
        id: 'Sales',
        domainFn: (ExampleModel sales, _) => sales.engagementsRate,
        measureFn: (ExampleModel sales, _) => sales.accountCount,
        data: data,
        labelAccessorFn: (ExampleModel sales, _) =>
            '${sales.engagementsRate}: ${sales.accountCount}',
      )
    ];
  }

  List<charts.Series<ExampleModel, String>> createAgeData(InfModel value) {
    final data = [
      new ExampleModel('0-18', value.age[0]["-18"]),
      new ExampleModel('18-25', value.age[0]["18-25"]),
      new ExampleModel('25-30', value.age[0]["25-30"]),
      new ExampleModel('30-40', value.age[0]["30-40"]),
      new ExampleModel('40+', value.age[0]["40+"]),
    ];

    return [
      new charts.Series<ExampleModel, String>(
        id: 'Sales',
        domainFn: (ExampleModel sales, _) => sales.engagementsRate,
        measureFn: (ExampleModel sales, _) => sales.accountCount,
        data: data,
        labelAccessorFn: (ExampleModel sales, _) =>
            '${sales.engagementsRate}: ${sales.accountCount}',
      )
    ];
  }
}
