import 'package:account_book/screens/accounts/detail.dart';
import 'package:account_book/widgets/account_book_graph.dart';
import 'package:flutter/material.dart';

import '../widgets/add_ab_btn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountBookDetail(),
                fullscreenDialog: true,
              ),
            );
          },
          child: const ABGraph(),
        ),
      ),
      floatingActionButton: const AddABFloatingBtn(),
    );
  }
}