import 'package:account_book/widgets/modals.dart';
import 'package:flutter/material.dart';

class DropDownCate extends StatefulWidget {
  final List<String> categories;
  const DropDownCate({
    super.key,
    required this.categories,
  });

  @override
  State<DropDownCate> createState() => _DropDownCateState();
}

class _DropDownCateState extends State<DropDownCate> {
  bool isClosed = true;

  @override
  void initState() {
    // categories = ABDataController().getCategories();

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
                  child: widget.categories.isEmpty
                      ? const Text("Add Btn")
                      : Text(
                          widget.categories[0],
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
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: isClosed ? 0 : 68 * (widget.categories.length - 1),
            child: createMenuItems(),
          ),
        ),
        if (!isClosed) createAddBtn(),
      ],
    );
  }

  Widget createAddBtn() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "카테고리 추가",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  Widget createMenuItems() {
    if (!isClosed && widget.categories.length >= 2) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.categories.length - 1,
        itemBuilder: (context, index) {
          return Expanded(
            child: createItem(widget.categories[index + 1], index + 1),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
      );
    }

    return const SizedBox();
  }

  Widget createItem(String item, int index) {
    return Container(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
      child: Row(
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
                onPressed: () {
                  String temp = widget.categories[0];
                  widget.categories[0] = item;
                  widget.categories[index] = temp;
                  closeMenu();
                },
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
                onPressed: () {
                  Modals.showRemoveModal(() {
                    setState(() {
                      widget.categories.remove(item);
                    });
                  }, context);
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                )),
          ),
        ],
      ),
    );
  }
}
