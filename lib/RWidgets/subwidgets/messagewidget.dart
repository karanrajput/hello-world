import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class RMessageItemWidget extends StatelessWidget {
  final RMessage message;
  final RMessage prevMessage;
  final RMessage nextMessage;
  const RMessageItemWidget(
      {Key key, this.message, this.prevMessage, this.nextMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOurMessage = message.by == FireRepo.instance.currentUser.uid;

    bool isOpeningMessage = true;
    if (prevMessage != null) {
      if (prevMessage.by == message.by) {
        isOpeningMessage = false;
      }
    }
    bool isEndingMessage = true;
    if (nextMessage != null) {
      if (nextMessage.by == message.by) {
        isEndingMessage = false;
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
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
              !isOpeningMessage
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: makeText(message.name ?? '',
                          fontSize: 12, weight: FontWeight.w500),
                    ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .8),
                decoration: BoxDecoration(
                    color: message.usertype == RUserType.STUDENT
                        ? Colors.white
                        : Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isOurMessage ? 10 : 5),
                      topRight: Radius.circular(isOurMessage ? 5 : 10),
                      bottomLeft: Radius.circular(isOurMessage ? 10 : 5),
                      bottomRight: Radius.circular(isOurMessage ? 5 : 10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: makeMes(),
                ),
              ),
              !isEndingMessage
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: makeText(
                          DateFormat('hh : mm a').format(message.timestamp),
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          weight: FontWeight.w400),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: missing_return
  Widget makeMes() {
    if (message.type == RMessageType.TEXT) {
      return makeText(
        message.message,
        alignment: TextAlign.start,
        fontSize: 14,
        color:
            message.usertype == RUserType.STUDENT ? Colors.black : Colors.white,
        weight: FontWeight.w500,
      );
    } else if (message.type == RMessageType.LIVE) {
      return RButton(
        text: "Join Meeting",
        onPressed: () async {
          try {
            var options = JitsiMeetingOptions(room: message.message);

            await JitsiMeet.joinMeeting(options);
          } catch (error) {
            debugPrint("error: $error");
          }
        },
      );
    } else if (message.type == RMessageType.IMAGE) {
      return Row(
        children: [
          makeText(
            "File",
            alignment: TextAlign.start,
            fontSize: 14,
            color: message.usertype == RUserType.STUDENT
                ? Colors.black
                : Colors.white,
            weight: FontWeight.w500,
          ),
          RButton(
            text: "Download",
            onPressed: () {},
          )
        ],
      );
    }
  }
}
