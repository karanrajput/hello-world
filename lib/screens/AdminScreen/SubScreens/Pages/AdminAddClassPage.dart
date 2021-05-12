import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:flutter/material.dart';

class AdminAddClassPage extends StatelessWidget {
  final codeController = TextEditingController();
  final nameController = TextEditingController();

  _addClassClick(BuildContext context) async {
    //TODO: Add Validation of fields

    var rclass = RClass(
      code: codeController.text,
      name: nameController.text,
    );
    await FireRepo.instance.addNewClass(rclass);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return makeCardContainer(
      alpha: 240,
      child: Material(
        color: Colors.transparent,
        child: makeScroll(
          child: Column(
            children: [
              RTextField(
                  label: "Code",
                  controller: codeController,
                  keyboardtype: TextInputType.number),
              makeSpace(10),
              RTextField(label: "Name", controller: nameController),
              makeSpace(50),
              RButton(
                expand: true,
                text: "Add",
                padding: EdgeInsets.symmetric(vertical: 15),
                onPressed: () => _addClassClick(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
