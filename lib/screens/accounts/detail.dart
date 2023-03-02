import 'package:account_book/widgets/account_book_graph.dart';
import 'package:account_book/widgets/add_ab_btn.dart';
import 'package:flutter/material.dart';

class AccountBookDetail extends StatefulWidget {
  const AccountBookDetail({super.key});

  @override
  State<AccountBookDetail> createState() => _AccountBookDetailState();
}

class _AccountBookDetailState extends State<AccountBookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddABFloatingBtn(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              const ABGraph(),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("test"),
                  Text("test2"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
