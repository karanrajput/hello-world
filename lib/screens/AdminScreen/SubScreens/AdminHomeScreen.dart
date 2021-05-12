import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/repos/UserRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/EntryScreen/EntryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: makeCenterContainer(Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          makeText("HomePage"),
          RButton(
            text: "Logout",
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(UserEventLogOut());
              Navigator.pop(context);
              Globals.navigateScreen(EntryScreen());
            },
          )
        ],
      )),
    );
  }
}
