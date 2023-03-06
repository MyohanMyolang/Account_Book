import 'package:account_book/screens/accounts/data_page.dart';
import 'package:flutter/material.dart';

class AddABFloatingBtn extends StatelessWidget {
  const AddABFloatingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {
        Navigator.push(
          context,
          getPageRoute(DataPageType.add),
        );
      },
      tooltip: "Add AB", // ShowAdd Account Book Add Page
      child: const Icon(Icons.add),
    );
  }

  MaterialPageRoute<dynamic> getPageRoute(DataPageType type) {
    return MaterialPageRoute(
      builder: (context) => DataPage(
        type: type,
      ),
    );
  }
}
