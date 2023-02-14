import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('列表详情')),
      body: const SizedBox.expand(
        child: Center(
          child: Text('列表详情页面'),
        ),
      ),
    );
  }
}

// class ListItem extends StatelessWidget {
//   const ListItem(BuildContext context, {super.key, required this.index});
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('列表详情$index')),
//       body: const SizedBox.expand(
//         child: Center(
//           child: Text('列表详情页面'),
//         ),
//       ),
//     );
//   }
// }