import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/class_bloc/class_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/HomeScreen/pages/Page_Subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesPage extends StatelessWidget {
  final List<RClass> classes = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ClassBloc>(context).add(ClassEventLoadClassList());
    return RSimpleScaffold(
      title: "",
      child: Container(child: BlocBuilder<ClassBloc, ClassState>(
        builder: (context, state) {
          if (state is ClassStateClassListLoaded) {
            classes.clear();
            classes.addAll(state.clases);
          }
          return classes.isNotEmpty
              ? _makeClassesList(context, classes)
              : makeCenterContainer(makeLoadingIndicator("Loading..."));
        },
      )),
    );
  }

  Widget _makeClassesList(BuildContext context, List<RClass> classes) {
    return ListView.builder(
        itemCount: classes.length,
        itemBuilder: (contextn, index) {
          return RClassItemWidget(
            rclass: classes[index],
            onPressed: () {
              Globals.navigateScreen(RSimpleScaffold(
                title: classes[index].name,
                child: SubjectsPage(
                  rclass: classes[index],
                ),
              ));
            },
          );
        });
  }
}
