import 'package:flutter/material.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  List dataList = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      dataList.add({'name': 'porject-item$i'});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('项目列表')),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                  '/project/detail',
                  arguments: ProjectDetailArguments(index + 1),
                );
              },
              child: Text('项目详情 -  [${index + 1}]'),
            ),
          );
        },
      ),
    );
  }
}

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as ProjectDetailArguments;
    return Scaffold(
        appBar: AppBar(title: Text('项目详情${args.id}')),
        body: Center(
          child: TextButton(
            child: Text('count: $count'),
            onPressed: () {
              setState(() {
                count++;
              });
            },
          ),
        ));
  }
}

class ProjectDetailArguments {
  final int id;

  ProjectDetailArguments(this.id);
}
