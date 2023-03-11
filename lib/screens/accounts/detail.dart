import 'package:account_book/models/account_book_model.dart';
import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:account_book/widgets/account_book_graph.dart';
import 'package:account_book/widgets/add_ab_btn.dart';
import 'package:account_book/widgets/detail_page_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../modules/date_calc.dart';

class AccountBookDetail extends StatefulWidget {
  const AccountBookDetail({super.key});

  @override
  State<AccountBookDetail> createState() => _AccountBookDetailState();
}

class _AccountBookDetailState extends State<AccountBookDetail> {
  ABDataController ctrl = ABDataController();
  List<String> dateList = [];
  DataList dataList = {};

  // _dateList에서 날짜 값을 받아오고 저장시킨다.
  // List<ABModel>

  @override
  void initState() {
    dateList = ctrl.getRecentDateListFromHive();
    dataList = DateCalc.getDataList(dateList[0], dateList[1]);
    super.initState();
  }

  void floatingBtnPressed() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: AddABFloatingBtn(
        onPress: floatingBtnPressed,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              // ignore: prefer_const_constructors
              ABGraph(),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _SelectDate(context, 0);
                      },
                      child: Text(
                        dateList[0],
                      ),
                    ),
                  ),
                  const Text("  -  ",
                      style: TextStyle(
                        fontSize: 30,
                      )),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _SelectDate(context, 1);
                      },
                      child: Text(
                        dateList[1],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.cyan,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("지출"),
                    Text("금액"),
                    Text("날짜"),
                  ],
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: dataList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  String key = dataList.keys.elementAt(index);
                  List<ABModel> modelList = dataList[key]!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: modelList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return DetailItem(model: modelList[index]);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _SelectDate(BuildContext context, int target) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate:
          DateFormat(ABDataController.DATE_FORMAT).parse(dateList[target]),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        dateList[target] =
            DateFormat(ABDataController.DATE_FORMAT).format(selected);
      });
    }
    ctrl.setRecentDateListToHive(dateList);
    setState(() {
      dataList = DateCalc.getDataList(dateList[0], dateList[1]);
    });
  }
}

/*
  TODO:
  1. detail Page에 보여줄 Widget제작
  Row에 감싸져 있으며, ABModel을 받아와 베이스로 제작
  2. Widget의 생김새 

  지출(수입) money Date    ModifyBtn DeleteBtn // 클릭시 아래에 Widget 공간이
  생기고 Des내용 표시
*/
