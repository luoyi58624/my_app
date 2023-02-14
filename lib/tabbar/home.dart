import 'package:flutter/material.dart';
import 'package:my_app/pages/list_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: OutlinedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/list-item');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ListItem()));
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
