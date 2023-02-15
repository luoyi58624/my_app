import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('一级页面')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('下一页')),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('上一页')),
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/');
                  // Get.back();
                },
                child: const Text('返回首页')),
          ],
        ),
      ),
    );
  }
}
