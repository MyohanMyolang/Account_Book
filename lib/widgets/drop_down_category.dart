import 'package:flutter/material.dart';

class DropDownCate extends StatefulWidget {
  const DropDownCate({super.key});

  @override
  State<DropDownCate> createState() => _DropDownCateState();
}

class _DropDownCateState extends State<DropDownCate> {
  bool isClosed = true;
  List<String> categories = <String>[];

  @override
  void initState() {
    // categories = ABDataController().getCategories();
    categories = [
      "일단",
      "아무",
      "거나",
      "넣어보자",
      "일단은",
      "아무거나",
      "아무",
      "거나",
      "넣어보자",
      "일단은",
      "아무거나"
    ];
    super.initState();
  }

  void closeMenu() {
    setState(() {
      isClosed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isClosed = !isClosed;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 9,
                child: Center(
                  child: categories.isEmpty
                      ? const Text("Add Btn")
                      : Text(
                          categories[0],
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                ),
              ),
              Flexible(
                flex: 1,
                child: isClosed
                    ? const Icon(Icons.arrow_drop_down)
                    : const Icon(Icons.arrow_drop_up),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          child: SizedBox(
            height: isClosed ? 0 : 68 * (3),
            child: createMenuItems(),
          ),
        ),
      ],
    );
  }

  Widget createMenuItems() {
    if (!isClosed && categories.length >= 2) {
      return ListView.separated(
        itemCount: categories.length - 1,
        itemBuilder: (context, index) {
          return Expanded(
            child: createItem(categories[index + 1]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
      );
    }

    return const SizedBox();
  }

  Widget createItem(String item) {
    return Row(
      children: [
        Flexible(
          flex: 9,
          child: Center(
            child: TextButton(
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              )),
        ),
      ],
    );
  }
}
