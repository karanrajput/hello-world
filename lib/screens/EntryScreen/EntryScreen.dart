import 'package:flutter/material.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "999222",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ElevatedButton(onPressed: () {}, child: Text("92")),
      ),
    );
  }
}
