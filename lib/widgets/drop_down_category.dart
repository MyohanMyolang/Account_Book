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
    categories = ["a", "b", "c", "d", "e", "f"];
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 7,
              child: Center(
                child: categories.isEmpty
                    ? const Text("Add Btn")
                    : TextButton(
                        onPressed: () {
                          setState(() {
                            isClosed = false;
                          });
                        },
                        child: Text(categories[0]),
                      ),
              ),
            ),
            Flexible(
              flex: 3,
              child: isClosed
                  ? const Icon(Icons.arrow_drop_down)
                  : const Icon(Icons.arrow_drop_up),
            ),
          ],
        ),
        createMenuItems(),
      ],
    );
  }

  Widget createMenuItems() {
    if (!isClosed && categories.length >= 2) {
      return ListView.builder(
        itemCount: categories.length - 1,
        itemBuilder: (context, index) {
          return Text(categories[index + 1]);
        },
      );
    }

    return const SizedBox();
  }

  Widget createItem() {
    return Row();
  }
}
