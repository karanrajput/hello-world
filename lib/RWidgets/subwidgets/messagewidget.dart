import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/services/services.dart';
import 'package:flutter/material.dart';

class RMessageItemWidget extends StatelessWidget {
  final RMessage message;
  final RMessage prevMessage;
  final RMessage nextMessage;
  const RMessageItemWidget(
      {Key key, this.message, this.prevMessage, this.nextMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOurMessage = message.by == "this";
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isOurMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: isOurMessage
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              prevMessage != null
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: makeText("Harsh",
                          fontSize: 11, weight: FontWeight.w500),
                    ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: makeText(
                    message.message,
                    alignment: TextAlign.start,
                    fontSize: 14,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
