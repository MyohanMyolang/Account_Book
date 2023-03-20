import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/account_book_model.dart';

class BarChart extends StatelessWidget {
  final List<List<ABModel>> dataList;
  const BarChart({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ABModel_Bar_Chart',
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries<List<ABModel>, String>>[
          ColumnSeries<List<ABModel>, String>(
            dataSource: dataList,
            xValueMapper: (List<ABModel> data, _) {
              return data.elementAt(0).date;
            },
            yValueMapper: (List<ABModel> data, _) {
              int result = 0;
              for (ABModel model in data) {
                result += model.money;
              }
              return result;
            },
          ),
        ],
      ),
    );
  }
}
