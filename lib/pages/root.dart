import 'package:flutter/material.dart';
import 'package:my_app/pages/base/task.dart';
import 'tabbar/home.dart';
import 'tabbar/im.dart';
import 'tabbar/my.dart';
import 'tabbar/project.dart';
import 'tabbar/tool.dart';
import 'base/project.dart';

// App根页面
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int tabIndex = 0;

  static const List<TabbarPage> tabbarPages = <TabbarPage>[
    TabbarPage(0, '首页', Icons.home, HomePage()),
    TabbarPage(1, '工具', Icons.widgets, ToolPage()),
    TabbarPage(2, '项目圈', Icons.school, ProjectPage()),
    TabbarPage(3, '消息', Icons.chat, ImPage()),
    TabbarPage(4, '我的', Icons.person, MyPage()),
  ];

  final List<GlobalKey<NavigatorState>> tabbarKeys =
      List<GlobalKey<NavigatorState>>.generate(
          tabbarPages.length, (int index) => GlobalKey()).toList();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final NavigatorState navigator = tabbarKeys[tabIndex].currentState!;
        if (!navigator.canPop()) {
          return true;
        }
        navigator.pop();
        return false;
      },
      child: Scaffold(
        body: buildBody(),
        bottomNavigationBar: buildMaterial2Tabbar(),
      ),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: tabIndex,
      children: tabbarPages
          .map((e) => buildNestRouter(e, tabbarKeys[e.index]))
          .toList(),
    );
  }

  Widget buildMaterial2Tabbar() {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          tabIndex = index;
        });
      },
      currentIndex: tabIndex,
      type: BottomNavigationBarType.fixed,
      items: tabbarPages.map((TabbarPage destination) {
        return BottomNavigationBarItem(
          icon: Icon(destination.icon),
          label: destination.title,
        );
      }).toList(),
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
      destinations: tabbarPages.map((TabbarPage destination) {
        return NavigationDestination(
          icon: Icon(destination.icon),
          label: destination.title,
        );
      }).toList(),
    );
  }

  Widget buildNestRouter(TabbarPage tabbar, GlobalKey key) {
    return Navigator(
      key: key,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case '/':
                return tabbar.page;
              case '/project/list':
                return const ProjectListPage();
              case '/project/detail':
                return const ProjectDetailPage();
              case '/task/list':
                return const TaskListPage();
              case '/task/detail':
                return const TaskDetailPage();
            }
            // assert(false);
            return const SizedBox();
          },
        );
      },
    );
  }
}

class TabbarPage {
  const TabbarPage(this.index, this.title, this.icon, this.page);
  final int index;
  final String title;
  final IconData icon;
  final Widget page;
}
