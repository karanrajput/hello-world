import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/services/services.dart';
import 'package:flutter/material.dart';

class RMessageItemWidget extends StatelessWidget {
  final RMessage message;
  const RMessageItemWidget({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 40,
        color: Globals.colorSecondary,
        child: makeCenterContainer(makeText(message.message)),
      ),
    );
  }
}
