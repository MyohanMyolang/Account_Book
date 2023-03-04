import 'package:account_book/models/account_book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

// TODO: Hive 라이브러리 사용법 익히고 이 프로젝트에 적용 시켜보기.

typedef DataList = Map<String, List<ABModel>>;

class ABDataController {
  late DataList _dataList;
  late final Box<ABModel> modelBox;

  static final ABDataController _instance = ABDataController._();

  void TestPutFunction() {
    modelBox.put(
        1,
        ABModel(
          isExpanse: true,
          index: 1,
          money: 100,
          descript: "이유이옵니다.",
          category: "카테고리",
          date: "2023.12.21",
        ));
  }

  void TestGetFunction() {
    ABModel? a = modelBox.get(1);
    print(a!.category);
  }

  Future<void> _hiveInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ABModelAdapter());

    modelBox = await Hive.openBox("ABBox");
  }

  Future<void> init() async {
    await _hiveInit();
  }

  ABDataController._() {
    init();
  }

  factory ABDataController() {
    return _instance;
  }

  void AddData(ABModel data) {
    List test;
  }

  void SaveDataToFile() {
    // TODO: 파일 저장 로직 작성 // List<String>에 jsonEncode를 이용하여 값을 하나하나 넣는다.
  }

  void SaveAll() {
    // _dataList에서 foreach문을 사용하여 감싸기
    // modelBox.put(model.index, model);
    // modelBox.put(model.date, model.index);
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