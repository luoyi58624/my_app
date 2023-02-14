import 'package:flutter/material.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('项目圈')),
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list-item');
                  // Navigator.push(
                  //     MaterialPageRoute(builder: (context) => ListItem()));
                },
                child: Text('Push /text [${index + 1}]'),
              ),
            );
          },
        ),
      ),
    );
  }
}
