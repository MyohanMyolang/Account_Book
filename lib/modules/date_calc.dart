import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:intl/intl.dart';

import '../models/account_book_model.dart';

class DateCalc {
  static DataList getDataList(String targetFirst, String targetLast) {
    DataList result = {};

    // 추후 맘내키면 처음 Data입력 로직 수정
    if (targetFirst == targetLast) {
      List<ABModel>? model = ABDataController().getDayDatas(targetFirst);
      if (model != null) result[targetFirst] = model;

      return result;
    }

    DateTime dateTime =
        DateFormat(ABDataController.DATE_FORMAT).parse(targetFirst);
    int differ = _getDiffer(
        DateFormat(ABDataController.DATE_FORMAT).parse(targetFirst),
        DateFormat(ABDataController.DATE_FORMAT).parse(targetLast));

    for (int i = 0; i <= differ; i++) {
      String date = DateFormat(ABDataController.DATE_FORMAT).format(dateTime);
      List<ABModel>? model = ABDataController().getDayDatas(date);
      if (model != null) result[date] = model;
      dateTime = dateTime.add(const Duration(days: 1));
    }

    return result;
  }

  static int _getDiffer(DateTime t1, DateTime t2) => t2.difference(t1).inDays;
}
