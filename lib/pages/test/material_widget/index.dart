import 'package:flutter/material.dart';

import '../../../model/widget_model.dart';

class MaterialWidgetPage extends StatelessWidget {
  MaterialWidgetPage({super.key});

  final List<CellModel> cellNames = [
    CellModel('ListView - 列表视图', '/test/material_widget/list_view'),
    CellModel('My Widget Test', '/test/material_widget/list_view'),
    CellModel('My Widget Test', '/test/material_widget/list_view'),
    CellModel('My Widget Test', '/test/material_widget/list_view'),
    CellModel('My Widget Test', '/test/material_widget/list_view'),
    CellModel('My Widget Test', '/test/material_widget/list_view'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Material Widget组件列表')),
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
