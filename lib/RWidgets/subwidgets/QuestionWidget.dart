import 'package:bkdschool/data/models/questionmodal.dart';
import 'package:flutter/material.dart';

class RQuestionItemWidget extends StatefulWidget {
  final RExamQsn question;

  const RQuestionItemWidget({Key key, this.question}) : super(key: key);

  @override
  _RQuestionItemWidgetState createState() => _RQuestionItemWidgetState();
}

enum options { op1, op2, op3, op4 }

class _RQuestionItemWidgetState extends State<RQuestionItemWidget> {
  options op = options.op1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(150, 184, 255, 97),
          border: Border.all(color: Color.fromARGB(150, 184, 255, 97)),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.859,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 8.0, right: 0, bottom: 8.0),
                child: Text(
                  widget.question.question,
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.black, fontFamily: "sf", fontSize: 25),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(50, 255, 255, 255),
                  border: Border.all(color: Color.fromARGB(150, 184, 255, 97)),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: op == options.op1
                              ? Color.fromARGB(160, 61, 132, 184)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              op = options.op1;
                            });
                          },
                          child: Text(
                            widget.question.op1,
                            softWrap: true,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: op == options.op2
                              ? Color.fromARGB(160, 61, 132, 184)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              op = options.op2;
                            });
                          },
                          child: Text(
                            widget.question.op2,
                            softWrap: true,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: op == options.op3
                              ? Color.fromARGB(160, 61, 132, 184)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              op = options.op3;
                            });
                          },
                          child: Text(
                            widget.question.op3,
                            softWrap: true,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: op == options.op4
                              ? Color.fromARGB(160, 61, 132, 184)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              op = options.op4;
                            });
                          },
                          child: Text(
                            widget.question.op4,
                            softWrap: true,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
