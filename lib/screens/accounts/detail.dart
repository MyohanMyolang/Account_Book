import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:account_book/widgets/account_book_graph.dart';
import 'package:account_book/widgets/add_ab_btn.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountBookDetail extends StatefulWidget {
  const AccountBookDetail({super.key});

  @override
  State<AccountBookDetail> createState() => _AccountBookDetailState();
}

class _AccountBookDetailState extends State<AccountBookDetail> {
  List<String?> dateList = List<String?>.filled(2, null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddABFloatingBtn(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              const ABGraph(),
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
                        dateList[0] ??= DateFormat(ABDataController.DATE_FORMAT)
                            .format(DateTime.now()),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _SelectDate(context, 1);
                      },
                      child: Text(
                        dateList[1] ??= DateFormat(ABDataController.DATE_FORMAT)
                            .format(DateTime.now()),
                      ),
                    ),
                  ),
                ],
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
          DateFormat(ABDataController.DATE_FORMAT).parse(dateList[target]!),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        dateList[target] =
            DateFormat(ABDataController.DATE_FORMAT).format(selected);
      });
    }
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