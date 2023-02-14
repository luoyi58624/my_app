import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  List dataList = [
    {name: 'xxx'}
  ];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      dataList.add({name: 'porject-item$i'});
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
