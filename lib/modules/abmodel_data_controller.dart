import 'package:account_book/models/account_book_model.dart';

// TODO: Hive 라이브러리 사용법 익히고 이 프로젝트에 적용 시켜보기.

class ABDataController {
  late List<ABModel> _dataList;

  static final ABDataController _instance = ABDataController._();

  ABDataController._() {
    /*
    TODO: File에서 Data를 가져오고 dataList에 초기화 시키는 코드를 작성.
     */
  }

  factory ABDataController() {
    return _instance;
  }

  void AddData(ABModel data) {
    _dataList.add(data);
  }

  void SaveDataToFile() {
    // TODO: 파일 저장 로직 작성 // List<String>에 jsonEncode를 이용하여 값을 하나하나 넣는다.
  }
}
