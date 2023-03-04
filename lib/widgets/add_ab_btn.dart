import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/account_book_model.dart';

class AddABFloatingBtn extends StatelessWidget {
  const AddABFloatingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {
        print("onPressed");
        ABDataController control = ABDataController();
        DateTime time = DateTime.now();
        ABModel data = ABModel(
          isExpanse: true,
          index: control.index,
          money: 100000,
          descript: "테스트용",
          category: "테스트용",
          date: DateFormat(ABDataController.DATE_FORMAT).format(time),
        );
        control.addData(data);
        List<ABModel>? dayList = control
            .getDayDatas(DateFormat(ABDataController.DATE_FORMAT).format(time));
        dayList?.forEach((element) {
          print(element);
        });
      },
      tooltip: "Add AB", // ShowAdd Account Book Add Page
      child: const Icon(Icons.add),
    );
  }
}
