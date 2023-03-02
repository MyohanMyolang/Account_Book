class ABModel {
  late bool isExpanse;
  late int index;
  late int money;
  late String descript;
  late String category;
  late String date;

  String encodeJson() {
    return "";
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