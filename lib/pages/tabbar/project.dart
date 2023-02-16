import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('项目圈')),
      body: DecoratedBox(
        child: Text('xxx'),
        decoration: BoxDecoration(color: Colors.red),
      ),
    );
  }
}
