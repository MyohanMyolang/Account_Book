import 'package:account_book/modules/abmodel_data_controller.dart';
import 'package:account_book/screens/about_screen.dart';
import 'package:account_book/screens/accounts/detail.dart';
import 'package:account_book/screens/home_screen.dart';
import 'package:account_book/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  ABDataController();
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

  bool isDarkTheme = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', "KR"),
      ], // DatePicker에 한국어가 보이도록 하는 설정.
      routes: getRoutes,
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isDarkTheme = !isDarkTheme;
                });
              },
              icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            )
          ],
        ),
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

  Map<String, WidgetBuilder> get getRoutes {
    return {
      '/detail': (context) => const AccountBookDetail(),
    };
  }
}
