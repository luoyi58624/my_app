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
