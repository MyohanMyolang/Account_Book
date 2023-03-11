import 'package:account_book/widgets/account_book_graph.dart';
import 'package:flutter/material.dart';

import '../widgets/add_ab_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(context, '/detail');
            setState(() {});
          },
          // ignore: prefer_const_constructors
          child: ABGraph(),
        ),
      ),
      floatingActionButton: const AddABFloatingBtn(),
    );
  }
}
