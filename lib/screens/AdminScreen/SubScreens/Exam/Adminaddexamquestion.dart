import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/NotificationModel.dart';
import 'package:bkdschool/data/models/questionmodal.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/zkaran/Screens/Testscreens.dart/Testmaterial.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AdminAddQuestion extends StatefulWidget {
  final bool editevent;
  final RExamQsn question;

  const AdminAddQuestion({Key key, this.editevent = false, this.question})
      : super(key: key);
  @override
  _AdminAddQuestionState createState() => _AdminAddQuestionState();
}

enum options { op1, op2, op3, op4 }

class _AdminAddQuestionState extends State<AdminAddQuestion> {
  final questionController = TextEditingController();
  final op1Controller = TextEditingController();
  final op2Controller = TextEditingController();
  final op3Controller = TextEditingController();
  final op4Controller = TextEditingController();

  // bool _checked = false;

  _addQsnClick(BuildContext context) async {
    var qsn = RExamQsn(
      question: questionController.text,
      op1: op1Controller.text,
      op2: op2Controller.text,
      op3: op3Controller.text,
      op4: op4Controller.text,
      ans: op.index,
    );
    if (widget.editevent) {
      FireRepo.instance.updateQuestion(qsn..docid = widget.question.docid);
    } else {
      var box = await Hive.openBox("questions");
      box.add(qsn.toMap());
      // FireRepo.instance.createNewQuestion(qsn);
    }
    Navigator.pop(context, qsn);
  }

  //   if (widget.editevent) {
  //     FireRepo.instance
  //         .updateNotification(notif..docid = widget.notification.docid);
  //   } else {

  //   }

  //   Navigator.of(context).pop();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   pickedDate = DateTime.now();
  //   if (widget.editevent) {
  //     headingController.text = widget.notification.heading;
  //     descriptionController.text = widget.notification.description;
  //     pickedDate = widget.notification.lastdate;
  //     _studentvalue = widget.notification.forstudent;
  //     _teachervalue = widget.notification.forteacher;
  //   }
  // }

  options op = options.op1;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(255, 220, 218, 254),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 0, bottom: 10),
                child: makeScroll(
                  child: Column(
                    children: [
                      TextField(
                        controller: questionController,
                        minLines: 1,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter Your Question",
                          labelText: "Question",
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: op1Controller,
                              minLines: 1,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Option 1",
                                labelText: "Option 1",
                              ),
                            ),
                          ),
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                op = value;
                              });
                            },
                            groupValue: op,
                            value: options.op1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: op2Controller,
                              minLines: 1,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Option 2",
                                labelText: "Option 2",
                              ),
                            ),
                          ),
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                op = value;
                              });
                            },
                            groupValue: op,
                            value: options.op2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: op3Controller,
                              minLines: 1,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Option 3",
                                labelText: "Option 3",
                              ),
                            ),
                          ),
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                op = value;
                              });
                            },
                            groupValue: op,
                            value: options.op3,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: op4Controller,
                              minLines: 1,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Option 4",
                                labelText: "Option 4",
                              ),
                            ),
                          ),
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                op = value;
                              });
                            },
                            groupValue: op,
                            value: options.op4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RButton(
                            text: "Submit",
                            color: Colors.blueAccent,
                            onPressed: () => _addQsnClick(context)),
                      ),
                      SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  // makeeditbuttons() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     mainAxisSize: MainAxisSize.max,
  //     children: [
  //       Expanded(
  //         child: RButton(
  //           expand: true,
  //           text: "Delete",
  //           padding: EdgeInsets.symmetric(vertical: 15),
  //           onPressed: () {
  //             FireRepo.instance.deleteNotification(widget.notification);
  //             Navigator.pop(context);
  //           },
  //         ),
  //       ),
  //       VerticalDivider(),
  //       Expanded(
  //         child: RButton(
  //           color: Colors.green,
  //           expand: true,
  //           text: "Update",
  //           padding: EdgeInsets.symmetric(vertical: 15),
  //           onPressed: () => _addQsnClick(context),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // _pickdate() async {
  //   DateTime date = await showDatePicker(
  //       context: context,
  //       initialDate: pickedDate,
  //       firstDate: DateTime(DateTime.now().year - 5),
  //       lastDate: DateTime(DateTime.now().year + 5));

  //   if (date != null)
  //     setState(() {
  //       pickedDate = date;
  //     });
  // }
}
