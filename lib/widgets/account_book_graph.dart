import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:account_book/modules/date_calc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    dateList = ctrl.getRecentDateListFromHive();
    dataList = DateCalc.getDataList(dateList[0], dateList[1]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "추후 표 넣기",
          style: TextStyle(fontSize: 28),
        ),
        const Text(
          "Total Expense",
          style: TextStyle(fontSize: 22),
        ),
        Text(
          nf.format(ctrl.getTotalExpense(dataList)),
          style: const TextStyle(fontSize: 22),
        )
      ],
    );
  }
}
