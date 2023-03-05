import 'package:account_book/models/account_book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

typedef DataList = Map<String, List<ABModel>>;

class ABDataController {
  late DataList _dataList;
  late final Box modelBox;
  late int index;
  static const String DATE_FORMAT = "yy/MM/dd";

  static final ABDataController _instance = ABDataController._();

  Future<void> _hiveInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ABModelAdapter());

    modelBox = await Hive.openBox("ABBox");
    int? isNull = modelBox.get("index");
    if (isNull != null) {
      index = isNull;
    } else {
      modelBox.put("index", 0);
      index = 0;
    }
  }

  void init() async {
    await _hiveInit();
    _dataList = {};
  }

  ABDataController._() {
    init();
  }

  factory ABDataController() {
    return _instance;
  }

  bool _getDayDataFromHive(String date) {
    List<int>? indexList = modelBox.get(date);
    if (indexList != null) {
      List<ABModel> models = [];
      for (int index in indexList) {
        ABModel? model = modelBox.get("$index");
        if (model != null) {
          models.add(model);
        }
      }
      _dataList[date] = models;
      return true;
    }

    return false;
  }

  void _setDayDataToHive(String date) {
    List<int> indexList = [];

    _dataList[date]?.forEach((element) {
      indexList.add(element.index);
    });

    modelBox.put(date, indexList);
  }

  bool checkHasData(String date) {
    bool hasData = false;

    for (String key in _dataList.keys) {
      if (key == date) hasData = true;
    }

    if (!hasData) {
      hasData = _getDayDataFromHive(date);
    }

    return hasData;
  }

  void addData(ABModel data) {
    bool hasData = checkHasData(data.date);
    if (hasData) {
      _dataList[data.date]!.add(data);
      modelBox.put("${data.index}", data);

      List<int> dateList = modelBox.get(data.date, defaultValue: []);
      dateList.add(data.index);
      modelBox.put(data.date, dateList);
    } else {
      _dataList[data.date] = [data];
      modelBox.put(data.date, [data.index]);
    }
    index++;
    modelBox.put("index", index);
  }

  /*
   * 기록되지 않은 날짜가 있을 경우 Null을 반환.
   */
  List<ABModel>? getDayDatas(String date) {
    bool hasData = checkHasData(date);
    if (hasData) {
      return _dataList[date]!;
    }

    return null;
  }

  // 이하 Test용 추후 삭제
  void removeAllData() {
    modelBox.clear();
  }

  void showAllDateListKeys() {
    print(_dataList.keys.toList());
  }
}




/**
 * TODO:
 * 1. Hive라이브러리 적용
 * 2. Hive Init을 할 때 가장 처음 앱을 실행 했을 때를 위한 Method 작성
 * 2.1) "recent"를 Key로 하여 최근에 접근한 Data Type을 확인
 * 2.2) 만약 없다면 일별로 나누는 것을 Default로 하여 생성한다.
 * 2.3) 있다면 그것을 기반으로 (3)을 실행. 
 * 3. DataTime.Now을 사용하여 날짜 단위로 Hive Box 생성 이때, recent를 참고하여
 *  ㄴ 최근에 값을 얻어온 Type을 check하여 그에 관한 데이터 까지 불러오기.
 *      ㄴ(Method를 미리 만들어 놓는다.)
 * 4. 
 */


/*
  모든 ABModel을 저장하며, 그 Data의 Key값은 index를 기반으로 저장한다.
  List는 날짜별로 등록하며, DataBase에 등록 된 Data는 Index를
    가지고 있는다.
  이후 그 List를 값으로 불러온 후 Index에 있는 것들을 Hive로 값을 불러온다.

*/