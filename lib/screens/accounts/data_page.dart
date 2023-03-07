import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DataPageType {
  add,
  modify,
}

class DataPage extends StatefulWidget {
  final DataPageType type;

  const DataPage({
    super.key,
    required this.type,
  });

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  bool isExpanse = true;
  String? date;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isExpanse ? "지출" : "수입",
                        style: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      Switch(
                        value: isExpanse,
                        onChanged: (value) => setState(() {
                          isExpanse = value;
                        }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    "Money",
                    "금액을 입력하여 주십시오.",
                    TextInputType.number,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    "Description",
                    "내용을 입력하여 주십시오.",
                    TextInputType.multiline,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date ?? "날짜선택",
                        style: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _SelectDate(context),
                        icon: const Icon(Icons.timer_outlined),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _SelectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        date = DateFormat(ABDataController.DATE_FORMAT).format(selected);
      });
    }
  }

  TextField CustomTextField(String label, String hintText, TextInputType type) {
    return TextField(
      maxLines: null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.cyan),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      keyboardType: type,
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
