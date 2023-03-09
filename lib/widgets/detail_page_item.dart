import 'package:account_book/models/account_book_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailItem extends StatefulWidget {
  final ABModel model;
  const DetailItem({super.key, required this.model});

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
              Text(widget.model.isExpanse ? "지출" : "수입"),
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
                    const Text("Description"),
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
                    icon: const Icon(Icons.description),
                    tooltip: "Show Description",
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    tooltip: "Edit Item",
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_circle),
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
