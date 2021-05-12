import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/buttons.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RUserInfoItemWidget extends StatelessWidget {
  final RUser ruser;
  final VoidCallback onPressed;
  final VoidCallback onCallPressed;

  const RUserInfoItemWidget(
      {Key key, this.ruser, this.onPressed, this.onCallPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return makeCardContainer(
      radius: 0,
      clickable: true,
      onPressed: onPressed,
      borderAlpha: 0,
      alpha: 0,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/pp.png'),
          ),
          makeSpace(15, true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                makeText(ruser.name, fontSize: 20),
                makeText("ID No. " + ruser.rollno + " | " + ruser.contactnumber,
                    fontSize: 14, weight: FontWeight.normal),
              ],
            ),
          ),
          RIconButton(
            icon: Icons.phone,
            iconSize: 20,
            onPressed: onCallPressed,
          ),
        ],
      ),
    );
  }
}
