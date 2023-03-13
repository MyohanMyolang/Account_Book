import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/account_book_model.dart';

enum DataPageType {
  add,
  modify,
}

class DataPage extends StatefulWidget {
  final DataPageType type;
  final ABModel? model;

  /*
   * type이 modify일 경우, model을 입력해주어야 한다.
   */
  const DataPage({
    super.key,
    required this.type,
    this.model,
  });

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  bool? isExpanse = true;
  String? date;
  final TextEditingController _moneyCtrl = TextEditingController();
  final TextEditingController _desCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.type == DataPageType.modify && widget.model != null) {
      isExpanse = widget.model!.isExpense;
      date = widget.model!.date;
      _moneyCtrl.text = widget.model!.money.toString();
      _desCtrl.text = widget.model!.descript;
    }
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, null);

        return true;
      },
      child: SafeArea(
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
                          isExpanse! ? "지출" : "수입",
                          style: const TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        Switch(
                          value: isExpanse!,
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
                      _moneyCtrl,
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      "Description",
                      "내용을 입력하여 주십시오.",
                      TextInputType.multiline,
                      _desCtrl,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date ??= DateFormat(ABDataController.DATE_FORMAT)
                              .format(DateTime.now()),
                          style: const TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _SelectDate(context),
                          icon: const Icon(Icons.timer_outlined),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context, null);
                            },
                            // style: ButtonStyle(
                            //   side: MaterialStateProperty.all(
                            //     BorderSide(
                            //       color: const Color.fromARGB(255, 205, 114, 89)
                            //           .withOpacity(0.5),
                            //       width: 1,
                            //     ),
                            //   ),
                            // ),
                            child: Text("취소",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.red[300])),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              String moneyText =
                                  _moneyCtrl.text.replaceAll(RegExp('\\D'), "");
                              if (moneyText != "") {
                                int money = int.parse(moneyText);
                                Navigator.pop(
                                  context,
                                  ABModel(
                                    isExpense: isExpanse!,
                                    index: DataPageType.modify == widget.type
                                        ? widget.model!.index
                                        : ABDataController().index,
                                    money: money,
                                    descript: _desCtrl.text,
                                    date: date!,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Center(
                                      child: Text(
                                        "Money를 입력하여 주십시오.",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "확인",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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

  TextField CustomTextField(String label, String hintText, TextInputType type,
      TextEditingController ctrl) {
    return TextField(
      controller: ctrl,
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

  @override
  void dispose() {
    _moneyCtrl.dispose();
    _desCtrl.dispose();

    super.dispose();
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
