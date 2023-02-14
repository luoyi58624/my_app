import 'package:flutter/material.dart';

class Tool extends StatefulWidget {
  const Tool({super.key});

  @override
  State<Tool> createState() => _ToolState();
}

class _ToolState extends State<Tool> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('工具')),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Text('count: $count'),
      )),
    );
  }
}
