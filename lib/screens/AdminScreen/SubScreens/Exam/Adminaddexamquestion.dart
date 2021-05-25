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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        RTextField(
                            label: "Question",
                            controller: questionController,
                            keyboardtype: TextInputType.multiline),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: RTextField(
                                    label: "Option 1",
                                    controller: op1Controller,
                                    keyboardtype: TextInputType.multiline),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: RTextField(
                                    label: "Option 2",
                                    controller: op2Controller,
                                    keyboardtype: TextInputType.multiline),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: RTextField(
                                    label: "Option 3",
                                    controller: op3Controller,
                                    keyboardtype: TextInputType.multiline),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: RTextField(
                                    label: "Option 4",
                                    controller: op4Controller,
                                    keyboardtype: TextInputType.multiline),
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
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RButton(
                              text: "Submit",
                              color: Colors.blueAccent,
                              onPressed: () => _addQsnClick(context)),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
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
