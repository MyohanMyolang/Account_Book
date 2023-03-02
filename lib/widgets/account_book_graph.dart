import 'package:flutter/material.dart';

class ABGraph extends StatelessWidget {
  const ABGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "AccountHero",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Options Select Container",
            style: TextStyle(fontSize: 22),
          ),
          Text(
            "Money is Zero! WoW",
            style: TextStyle(fontSize: 28),
          ),
          Text(
            "Total Expense : ",
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
