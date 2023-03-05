import 'package:flutter/material.dart';

class AddABFloatingBtn extends StatelessWidget {
  const AddABFloatingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {},
      tooltip: "Add AB", // ShowAdd Account Book Add Page
      child: const Icon(Icons.add),
    );
  }
}
