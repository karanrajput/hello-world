import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/AdminScreen/AdminScreen.dart';
import 'package:bkdschool/screens/EntryScreen/pages/Page_Login.dart';
import 'package:bkdschool/screens/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "",
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserStateLoading) {
            return makeCenterContainer(makeLoadingIndicator("Loading..."));
          } else if (state is UserStateNotAuthenticated) {
            return LoginPage();
          } else if (state is UserStateAuthenticated) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Globals.navigateScreen(HomeScreen(), closePrevious: true);
            });
            return makeCenterContainer(makeLoadingIndicator("Loading..."));
          } else if (state is UserStateAdmin) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Globals.navigateScreen(AdminScreen(), closePrevious: true);
            });
            return makeCenterContainer(makeText("Logged in as Admin"));
          } else if (state is UserStateError) {
            return makeCenterContainer(
                makeIconText(state.message, Icons.dangerous));
          } else {
            return makeCenterContainer(makeText("No State"));
          }
        },
      ),
    );
  }
}
