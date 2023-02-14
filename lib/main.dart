import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/list_item.dart';
import 'package:my_app/router/router.dart';
import 'package:my_app/tabbar/home.dart';
import 'package:my_app/tabbar/im.dart';
import 'package:my_app/tabbar/my.dart';
import 'package:my_app/tabbar/project.dart';
import 'package:my_app/tabbar/tool.dart';
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
      // routes: router,
      home: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> with SingleTickerProviderStateMixin {
  int count = 0;

  int tabIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: tabIndex);
  }

  void switchTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: buildStackBody(),
      ),
      bottomNavigationBar: buildMaterial2Tabbar(),
    );
  }

  final homeKey = GlobalKey<NavigatorState>();
  final toolKey = GlobalKey<NavigatorState>();
  final projectKey = GlobalKey<NavigatorState>();
  Widget buildTabbarPage(page, key) {
    return Navigator(
      key: key,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case '/':
                return page;
              case '/list-item':
                return const ListItem();
            }
            // assert(false);
            return const SizedBox();
          },
        );
      },
    );
  }

  Widget buildStackBody() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Offstage(
            offstage: tabIndex != 0,
            child: buildTabbarPage(const Home(), homeKey)),
        Offstage(
            offstage: tabIndex != 1,
            child: buildTabbarPage(const Tool(), toolKey)),
        Offstage(
            offstage: tabIndex != 2,
            child: buildTabbarPage(const Project(), projectKey)),
        Offstage(offstage: tabIndex != 3, child: const Im()),
        Offstage(offstage: tabIndex != 4, child: const My())
      ],
    );
  }

  Widget buildIndexStackBody() {
    return IndexedStack(
      index: tabIndex,
      children: const [
        Home(),
        Tool(),
        Project(),
        Im(),
        My(),
      ],
    );
  }

  Widget buildPageViewBody() {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: const [
        Home(),
        Tool(),
        Project(),
        Im(),
        My(),
      ],
      onPageChanged: (index) {
        setState(() {
          tabIndex = index;
        });
      },
    );
  }

  Widget buildMaterial2Tabbar() {
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

  Widget buildMaterial3Tabbar() {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          tabIndex = index;
        });
      },
      selectedIndex: tabIndex,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home),
          label: '首页',
        ),
        NavigationDestination(
          icon: Icon(Icons.widgets),
          label: '工具',
        ),
        NavigationDestination(
          icon: Icon(Icons.school),
          label: '项目圈',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat),
          label: '消息',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: '我的',
        ),
      ],
    );
  }
}
