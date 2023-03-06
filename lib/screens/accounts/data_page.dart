import 'package:flutter/material.dart';

enum DataPageType {
  add,
  modify,
}

class DataPage extends StatelessWidget {
  final DataPageType type;

  const DataPage({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text("dataPage"),
      ),
    );
  }
}

/*
  이 페이지는 Data Add 또는 Data Modify를 담당하는 Page이다.
  이 페이지를 부를 때 Type을 정하게 되는데, Enum으로 담당하며,
  Enum의 값은 add, modify로 현재 두 가지이다. 추후 추가가 필요하면 Enum을 통한 수정
  
  Type에 따라 작동 로직이 달라짐.
  
  TODO: 
  1. add Type에 대한 페이지 부터 작성.
  2. 그걸 토대로 modify를 작성한다.
*/
