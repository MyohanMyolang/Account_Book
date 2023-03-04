import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:flutter/material.dart';

class AddABFloatingBtn extends StatelessWidget {
  const AddABFloatingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {
        ABDataController control = ABDataController();
        control.showAllDateListKeys();
      },
      tooltip: "Add AB", // ShowAdd Account Book Add Page
      child: const Icon(Icons.add),
    );
  }
}
