import 'package:account_book/models/account_book_model.dart';
import 'package:account_book/screens/accounts/data_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef RemoveItemBtnFunc = void Function(ABModel);
typedef ModifyItemBtnFunc = void Function(ABModel, ABModel);

class DetailItem extends StatefulWidget {
  final ABModel model;
  final RemoveItemBtnFunc onRemove;
  final ModifyItemBtnFunc onModify;
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
              Text(widget.model.isExpense ? "μ§μΆ" : "μμ"),
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
                    onPressed: () async {
                      ABModel? model = await Navigator.push<ABModel?>(
                        context,
                        MaterialPageRoute<ABModel?>(
                          builder: (context) => DataPage(
                            type: DataPageType.modify,
                            model: widget.model,
                          ),
                        ),
                      );
                      if (model != null) {
                        widget.onModify(widget.model, model);
                      }
                    },
                    icon: const Icon(Icons.edit),
                    tooltip: "Edit Item",
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              "μ λ§λ‘ μ­μ  νμκ² μ΅λκΉ?",
                              style: TextStyle(color: Colors.red),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const [
                                  Text('μ­μ νμκΈ°λ₯Ό μνμλ©΄ νμΈ λ²νΌμ λλ¬μ£ΌμΈμ.')
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
                                  "νμΈ",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("μ·¨μ"),
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
