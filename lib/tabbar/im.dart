import 'package:flutter/material.dart';

class Im extends StatefulWidget {
  const Im({super.key});

  @override
  State<Im> createState() => _ImState();
}

class _ImState extends State<Im> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('聊天')),
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
