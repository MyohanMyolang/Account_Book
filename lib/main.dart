import 'package:account_book/screens/about_screen.dart';
import 'package:account_book/screens/home_screen.dart';
import 'package:account_book/screens/setting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AccountBook());
}

class AccountBook extends StatefulWidget {
  const AccountBook({super.key});

  @override
  State<AccountBook> createState() => _AccountBookState();
}

class _AccountBookState extends State<AccountBook> {
  // This widget is the root of your application.
  int _selectedIndex = 1;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    AboutScreen(),
    HomeScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.question_mark),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
