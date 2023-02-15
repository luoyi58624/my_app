import 'package:flutter/material.dart';

class ToolPage extends StatefulWidget {
  const ToolPage({super.key});

  @override
  State<ToolPage> createState() => _ToolPagePageState();
}

class _ToolPagePageState extends State<ToolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('工具')),
      body: const Center(child: Text('工具页面')),
    );
  }
}
