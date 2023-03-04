import 'package:flutter/material.dart';

class AddABFloatingBtn extends StatelessWidget {
  const AddABFloatingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {},
      tooltip: "Add AB",
      child: const Icon(Icons.add),
    );
  }
}