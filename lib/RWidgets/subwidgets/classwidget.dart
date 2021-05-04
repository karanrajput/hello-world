import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:flutter/material.dart';

class RClassItemWidget extends StatelessWidget {
  final RClass rclass;
  final VoidCallback onPressed;

  const RClassItemWidget({Key key, this.rclass, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40,
          color: Globals.colorMain,
          child: makeCenterContainer(makeText(rclass.name)),
        ),
      ),
    );
  }
}
