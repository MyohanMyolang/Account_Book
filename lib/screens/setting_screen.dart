import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              ABDataController().removeAllData();
            },
            child: const Text("Remove All Hive")),
      ),
    );
  }
}
