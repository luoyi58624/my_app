import 'package:flutter/material.dart';

import '../../../model/widget_model.dart';

class MyWidgetPage extends StatelessWidget {
  MyWidgetPage({super.key});

  final List<CellModel> cellNames = [
    CellModel('Demo - 测试组件', '/test/my_widget/demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Widget组件列表')),
        body: ListView.builder(
          itemCount: cellNames.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cellNames[index].name),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                Navigator.pushNamed(context, cellNames[index].url);
              },
            );
          },
        ));
  }
}
