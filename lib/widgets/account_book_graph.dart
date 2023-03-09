import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:flutter/material.dart';

class ABGraph extends StatefulWidget {
  const ABGraph({super.key});

  @override
  State<ABGraph> createState() => _ABGraphState();
}

class _ABGraphState extends State<ABGraph> {
  List<String> dateList = [];
  ABDataController ctrl = ABDataController();
  @override
  void initState() {
    dateList = ctrl.getRecentDateListFromHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "추후 표 넣기",
          style: TextStyle(fontSize: 28),
        ),
        Text(
          "Total Expense : ",
          style: TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
