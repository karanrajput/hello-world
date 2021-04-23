//
// Textfield Item
//
import 'package:flutter/material.dart';

class RTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final String title;

  const RTextField(
      {this.controller,
      this.title = "Text Field",
      this.keyboardtype = TextInputType.number});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardtype,
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
