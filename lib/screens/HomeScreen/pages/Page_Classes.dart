import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/class_bloc/class_bloc.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/EntryScreen/EntryScreen.dart';
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
      actions: [
        TextButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(UserEventLogOut());
              Navigator.pop(context);
              Globals.navigateScreen(EntryScreen());
            },
            child: Text("Log Out"))
      ],
      child: Container(child: BlocBuilder<ClassBloc, ClassState>(
        builder: (context, state) {
          if (state is ClassStateClassListLoaded) {
            classes.clear();
            classes.addAll(state.clases);
          }
          return classes.isNotEmpty
              ? _makeClassesList(context)
              : makeCenterContainer(makeLoadingIndicator("Loading..."));
        },
      )),
    );
  }

  Widget _makeClassesList(BuildContext context) {
    return ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return RClassItemWidget(
            rclass: classes[index],
            onPressed: () async {
              Globals.instance.currentClass = classes[index];
              Globals.instance.subjects =
                  await FireRepo.instance.getSubjectsOfClass(classes[index]);
              Globals.navigateScreen(SubjectsPage(
                rclass: classes[index],
              ));
            },
          );
        });
  }
}
