import 'package:hive_flutter/hive_flutter.dart';

part 'account_book_model.g.dart';

@HiveType(typeId: 0)
class ABModel {
  @HiveField(0)
  late bool isExpense;
  @HiveField(1)
  late int index;
  @HiveField(2)
  late int money;
  @HiveField(3)
  late String descript;
  @HiveField(4)
  late String date;
  @HiveField(5)
  late String category;

  ABModel({
    required this.isExpense,
    required this.index,
    required this.money,
    required this.descript,
    required this.date,
    required this.category,
  });

  ABModel.fromJson(Map<String, dynamic> data)
      : isExpense = data["isExpense"],
        index = data["index"],
        money = data["money"],
        descript = data["descript"],
        date = data["date"],
        category = data["category"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["isExpense"] = isExpense;
    data["index"] = index;
    data["money"] = money;
    data["descript"] = descript;
    data["date"] = date;
    data["category"] = category;
    return data;
  }

  @override
  String toString() {
    return 'ABModel{isExpense: $isExpense, index: $index, money: $money, descript: $descript, date: $date, category: $category}';
  }
}


/*
  Key/Fields의 형태로 key값이 저장 된다.
  index를 기반으로 key가 만들어진다.

  Keys에는 key들이 들어가 있고, 이들은 index 순서로 되어 있다.

  stack을 사용하여 후입선출 기반 데이터를 만든다.

  싱글톤 기반의 account_book_model을 기록하는 DataModel을 하나 만든다.

  SharedPreferences를 이용하여 데이터를 저장한다.

  json.encode or json.decode를 이용한다.
 */