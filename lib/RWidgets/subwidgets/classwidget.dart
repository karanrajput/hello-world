import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
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
      child: makeCardContainer(
        clickable: true,
        onPressed: onPressed,
        child: makeCenterContainer(Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              makeText(rclass.name, fontSize: 25, alignment: TextAlign.center),
        )),
      ),
    );
  }
}
