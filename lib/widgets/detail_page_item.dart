import 'package:account_book/models/account_book_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef ItemBtnFunc = void Function(ABModel);

class DetailItem extends StatefulWidget {
  final ABModel model;
  final ItemBtnFunc onRemove;
  final ItemBtnFunc onModify;
  const DetailItem({
    super.key,
    required this.model,
    required this.onModify,
    required this.onRemove,
  });

  @override
  State<DetailItem> createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  bool isShowDes = false;
  var nf = NumberFormat.currency(locale: "ko_KR", symbol: "");
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.cyan,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.model.isExpense ? "지출" : "수입"),
              Text(nf.format(widget.model.money)),
              Text(widget.model.date),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isShowDes)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(widget.model.descript),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isShowDes = !isShowDes;
                      });
                    },
                    icon: const Icon(
                      Icons.description,
                      color: Colors.blue,
                    ),
                    tooltip: "Show Description",
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    tooltip: "Edit Item",
                  ),
                  IconButton(
                    onPressed: () {
                      // ctrl.delete
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              "정말로 삭제 하시겠습니까?",
                              style: TextStyle(color: Colors.red),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const [
                                  Text('삭제하시기를 원하시면 확인 버튼을 눌러주세요.')
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  widget.onRemove(widget.model);
                                },
                                child: const Text(
                                  "확인",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("취소"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    tooltip: "Remove Item",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
