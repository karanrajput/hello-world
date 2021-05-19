class RExamQsn {
  String docid;
  final String question;
  final int ans;
  final String op1;
  final String op2;
  final String op3;
  final String op4;

  RExamQsn({this.question, this.ans, this.op1, this.op2, this.op3, this.op4});

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'ans': ans,
      'op1': op1,
      'op2': op2,
      'op3': op3,
      'op4': op4,
    };
  }

  factory RExamQsn.fromMap(Map<String, dynamic> map) {
    return RExamQsn(
      question: map['question'],
      ans: map['ans'],
      op1: map['op1'],
      op2: map['op2'],
      op3: map['op3'],
      op4: map['op4'],
    );
  }
}
