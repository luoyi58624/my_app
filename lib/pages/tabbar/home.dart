import 'package:flutter/material.dart';
import 'package:my_app/pages/base/project.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: homeKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => buildDefaultPage();
            break;
          case '/project/list':
            builder = (BuildContext _) {
              final id = (settings.arguments as Map)['id'];
              return FeedDetail(
                feedId: id,
              );
            };
            break;
          default:
            builder = (BuildContext _) => const HomeFeeds();
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            debugPrint(settings.name);
            switch (settings.name) {
              case '/':
                return buildDefaultPage();
              case '/project/list':
                return const ProjectListPage();
              case '/project/detail':
                return const ProjectDetailPage();
              default:
                return buildDefaultPage();
            }
          },
        );
      },
    );
  }

  Widget buildDefaultPage() {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/project/list');
              },
              child: const Text('跳转嵌套子页面'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed('/nest/one');
              },
              child: const Text('跳转嵌套页面'),
            ),
          ],
        ),
      ),
    );
  }
}
