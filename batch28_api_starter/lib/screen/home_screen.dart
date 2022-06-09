import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: [
          // Navigate to the Search Screen
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.card_travel_rounded)),
        ],
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Username'),
                subtitle: Text('admin'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
