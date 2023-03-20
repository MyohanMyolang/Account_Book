import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:account_book/modules/date_calc.dart';
import 'package:account_book/widgets/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/account_book_model.dart';

class ABGraph extends StatefulWidget {
  const ABGraph({super.key});

  @override
  State<ABGraph> createState() => _ABGraphState();
}

class _ABGraphState extends State<ABGraph> {
  List<String> dateList = [];
  ABDataController ctrl = ABDataController();
  DataList dataList = {};
  var nf = NumberFormat.currency(locale: "ko_KR", symbol: "");
  @override
  void initState() {
    super.initState();
  }

  List<List<ABModel>> convertMapToList() {
    List<List<ABModel>> data = [];
    dataList.forEach((key, value) {
      data.add(value);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    dateList = ctrl.getRecentDateListFromHive();
    dataList = DateCalc.getDataList(dateList[0], dateList[1]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BarChart(dataList: convertMapToList()),
        const Text(
          "Total Expense",
          style: TextStyle(fontSize: 22),
        ),
        Text(
          nf.format(ctrl.getTotalExpense(
              dataList)), // -일 경우 money의 수익이 있습니다. / +일 경우 money의 지출이 발생하였습니다.
          style: const TextStyle(fontSize: 22),
        )
      ],
    );
  }
}
