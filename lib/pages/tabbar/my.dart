import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<CellModel> cellNames = [
    CellModel('Material Widget Test', '/test/material_widget/list_view'),
    CellModel('My Widget Test', '/test/material_widget/list_view'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: buildCell(),
    );
  }

  Widget buildCell() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4,
        child: Column(
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

class CellModel {
  final String name;
  final String url;

  CellModel(this.name, this.url);
}
