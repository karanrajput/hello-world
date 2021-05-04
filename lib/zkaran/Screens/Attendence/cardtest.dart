import 'package:flutter/material.dart';

/// This is the main application widget.

/// This is the stateful widget that the main application instantiates.
class Testcard extends StatefulWidget {
  const Testcard({Key key}) : super(key: key);

  @override
  _TestcardState createState() => _TestcardState();
}

/// This is the private State class that goes with Testcard.
class _TestcardState extends State<Testcard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Item'),
      selected: 1 == _selectedIndex,
      onTap: () {
        setState(() {
          _selectedIndex = 1;
        });
      },
    );
  }
}
