import 'package:flutter/material.dart';
import 'package:my_app/pages/test/material_widget/index.dart';
import 'package:my_app/pages/test/my_widget/index.dart';

import '../../model/widget_model.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final myKey = GlobalKey<NavigatorState>();
  List<CellModel> cellNames = [
    CellModel('Material Widget页面', '/test/material_widget'),
    CellModel('My Widget页面', '/test/my_widget'),
  ];
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: myKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            debugPrint(settings.name);
            switch (settings.name) {
              case '/':
                return buildDefaultPage();
              case '/test/material_widget':
                return MaterialWidgetPage();
              case '/test/my_widget':
                return MyWidgetPage();
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
      appBar: AppBar(title: const Text('我的')),
      body: buildCell(),
    );
  }

  Widget buildCell() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: cellNames
                .map((e) => ListTile(
                      title: Text(e.name),
                      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                      onTap: () {
                        Navigator.pushNamed(context, e.url);
                      },
                    ))
                .toList()),
      ),
    );
  }

  Widget buildCell2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: cellNames.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(cellNames[index].name),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {
              Navigator.pushNamed(context, cellNames[index].url);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1.0),
      ),
    );
  }
}
