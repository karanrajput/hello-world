import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:flutter/material.dart';
import 'AdminClassDetailScreen.dart';

class AdminClassScreen extends StatefulWidget {
  @override
  _AdminClassScreenState createState() => _AdminClassScreenState();
}

class _AdminClassScreenState extends State<AdminClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: FireRepo.instance.getClassesListStream(),
          builder: (context, AsyncSnapshot<List<RClass>> snapshot) {
            if (snapshot.hasData) {
              return _makeClassesList(context, snapshot.data);
            } else if (snapshot.hasError) {
              return makeCenterContainer(
                  makeIconText("Error loading data", Icons.error));
            } else {
              return makeCenterContainer(makeLoadingIndicator(""));
            }
          }),
    );
  }

  Widget _makeClassesList(BuildContext context, List<RClass> classes) {
    return GridView.builder(
      padding: EdgeInsets.all(5),
      physics: BouncingScrollPhysics(),
      itemCount: classes.length,
      itemBuilder: (contextn, index) {
        return RClassItemWidget(
          rclass: classes[index],
          onPressed: () {
            Globals.navigateScreen(AdminClassDetailScreen(
              rclass: classes[index],
            ));
          },
        );
      },
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
