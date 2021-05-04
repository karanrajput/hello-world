import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:flutter/material.dart';

class AdminClassScreen extends StatefulWidget {
  @override
  _AdminClassScreenState createState() => _AdminClassScreenState();
}

class _AdminClassScreenState extends State<AdminClassScreen> {
  List<RClass> classes = [];

  @override
  initState() {
    super.initState();
    FireRepo.instance.getClassesList().then((value) {
      classes = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "Classes",
      child: Container(
        child: _makeClassesList(context, classes),
      ),
    );
  }

  Widget _makeClassesList(BuildContext context, List<RClass> classes) {
    return ListView.builder(
        itemCount: classes.length,
        itemBuilder: (contextn, index) {
          return RClassItemWidget(
            rclass: classes[index],
            onPressed: () {},
          );
        });
  }
}
