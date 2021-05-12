import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:flutter/material.dart';

//
//
//NOT IN USE
//
//

class AccountSetupPage extends StatelessWidget {
  final nameController = TextEditingController();

  final typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      makeText("Account Setup"),
      makeSpace(20),
      makeText("Form"),
      RTextField(
        controller: nameController,
        keyboardtype: TextInputType.name,
      ),
      RTextField(
        controller: typeController,
        keyboardtype: TextInputType.text,
      ),
      RButton(
        text: "Complete Setup",
        onPressed: () {},
      ),
    ]);
  }
}
