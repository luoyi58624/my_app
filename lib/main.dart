import 'package:flutter/material.dart';
import 'color_schemes.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      home: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  int count = 0;

  int tabIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ElevatedButton(
      onPressed: null,
      child: Text('hello'),
    ),
    Text(
      'Index 2',
      style: optionStyle,
    ),
    Text(
      'Index 3',
      style: optionStyle,
    ),
    Text(
      'Index 4',
      style: optionStyle,
    ),
    Text(
      'Index 5',
      style: optionStyle,
    ),
  ];

  void switchTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: _widgetOptions.elementAt(tabIndex),
      ),
      bottomNavigationBar: material3Navbar(),
    );
  }

  Widget material2Navbar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '首页',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets),
          label: '工具',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: '项目圈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: '消息',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '我的',
        ),
      ],
      currentIndex: tabIndex,
      onTap: switchTab,
      type: BottomNavigationBarType.fixed,
    );
  }

  Widget material3Navbar() {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          tabIndex = index;
        });
      },
      selectedIndex: tabIndex,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        NavigationDestination(
          icon: Icon(Icons.commute),
          label: 'Commute',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.bookmark),
          icon: Icon(Icons.bookmark_border),
          label: 'Saved',
        ),
      ],
    );
  }
}
