import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/NotificationModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:flutter/material.dart';

class AdminAddEvent extends StatefulWidget {
  final bool editevent;
  final RNotification notification;

  const AdminAddEvent({Key key, this.editevent = false, this.notification})
      : super(key: key);
  @override
  _AdminAddEventState createState() => _AdminAddEventState();
}

class _AdminAddEventState extends State<AdminAddEvent> {
  final headingController = TextEditingController();

  final descriptionController = TextEditingController();

  bool _checked = false;

  _addNotificationClick(BuildContext context) async {
    var notif = RNotification(
      heading: headingController.text,
      description: descriptionController.text,
      lastdate: pickedDate,
      forstudent: _studentvalue,
      forteacher: _teachervalue,
    );
    if (widget.editevent) {
      FireRepo.instance
          .updateNotification(notif..docid = widget.notification.docid);
    } else {
      FireRepo.instance.createNewNotification(notif);
    }

    Navigator.of(context).pop();
  }

  bool _studentvalue = false;
  bool _teachervalue = false;
  DateTime pickedDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime.now();
    if (widget.editevent) {
      headingController.text = widget.notification.heading;
      descriptionController.text = widget.notification.description;
      pickedDate = widget.notification.lastdate;
      _studentvalue = widget.notification.forstudent;
      _teachervalue = widget.notification.forteacher;
    }
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
              makeText(
                widget.editevent ? "Edit Notification" : 'Create Notification',
                fontSize: 25,
                weight: FontWeight.bold,
              ),
              makeSpace(10),
              RTextField(
                  label: "Heading",
                  controller: headingController,
                  keyboardtype: TextInputType.text),
              makeSpace(10),
              RTextField(
                  label: "Description", controller: descriptionController),
              makeSpace(20),
              ListTile(
                title: makeText(
                  "Select Last Date: ${pickedDate.day}-${pickedDate.month}-${pickedDate.year}",
                  weight: FontWeight.normal,
                  alignment: TextAlign.left,
                  fontSize: 19,
                ),
                trailing: Icon(Icons.date_range),
                onTap: _pickdate,
              ),
              makeSpace(20),
              CheckboxListTile(
                  title: Text("For Student"),
                  value: _studentvalue,
                  onChanged: (v) {
                    setState(() {
                      _studentvalue = v;
                    });
                  }),
              CheckboxListTile(
                  title: Text("For Teacher"),
                  value: _teachervalue,
                  onChanged: (v) {
                    setState(() {
                      _teachervalue = v;
                    });
                  }),
              makeSpace(50),
              widget.editevent
                  ? makeeditbuttons()
                  : RButton(
                      expand: true,
                      text: "Add",
                      padding: EdgeInsets.symmetric(vertical: 15),
                      onPressed: () => _addNotificationClick(context),
                    )
            ],
          ),
        ),
      ),
    );
  }

  makeeditbuttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: RButton(
            expand: true,
            text: "Delete",
            padding: EdgeInsets.symmetric(vertical: 15),
            onPressed: () {
              FireRepo.instance.deleteNotification(widget.notification);
              Navigator.pop(context);
            },
          ),
        ),
        VerticalDivider(),
        Expanded(
          child: RButton(
            color: Colors.green,
            expand: true,
            text: "Update",
            padding: EdgeInsets.symmetric(vertical: 15),
            onPressed: () => _addNotificationClick(context),
          ),
        )
      ],
    );
  }

  _pickdate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }
}
