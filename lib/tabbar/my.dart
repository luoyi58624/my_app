import 'package:flutter/material.dart';

class My extends StatefulWidget {
  const My({super.key});

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
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
