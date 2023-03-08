import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:account_book/screens/accounts/data_page.dart';
import 'package:flutter/material.dart';

import '../models/account_book_model.dart';

class AddABFloatingBtn extends StatelessWidget {
  const AddABFloatingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () async {
        ABModel? model = await Navigator.push<ABModel?>(
          context,
          getPageRoute(DataPageType.add),
        );
        if (model != null) {
          ABDataController().addData(model);
        }
        ABDataController().showAllDateListKeys();
        //ABDataController().removeAllData();
      },
      tooltip: "Add AB", // ShowAdd Account Book Add Page
      child: const Icon(Icons.add),
    );
  }

  MaterialPageRoute<ABModel?> getPageRoute(DataPageType type) {
    return MaterialPageRoute<ABModel?>(
      builder: (context) => DataPage(
        type: type,
      ),
    );
  }
}
