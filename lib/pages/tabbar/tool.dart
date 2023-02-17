import 'package:flutter/material.dart';
import 'package:my_app/pages/base/task.dart';

class ToolPage extends StatefulWidget {
  const ToolPage({super.key});

  @override
  State<ToolPage> createState() => _ToolPagePageState();
}

class _ToolPagePageState extends State<ToolPage> {
  final toolKey = GlobalKey<NavigatorState>();
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: toolKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            debugPrint(settings.name);
            switch (settings.name) {
              case '/':
                return buildDefaultPage();
              case '/task/list':
                return const TaskListPage();
              case '/task/detail':
                return const TaskDetailPage();
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
      appBar: AppBar(title: const Text('工具')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/task/list');
              },
              child: const Text('跳转嵌套子页面'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text('count: $count'),
            ),
          ],
        ),
      ),
    );
  }
}
