import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      makeText("Not Registered"),
      makeSpace(20),
      makeText("SignIn"),
      RTextField(
        controller: _usernameController,
        keyboardtype: TextInputType.text,
        title: "User Name",
      ),
      RTextField(
        controller: _passController,
        keyboardtype: TextInputType.visiblePassword,
        title: "Password",
      ),
      RButton(
        text: "Signin Email",
        onPressed: () {
          BlocProvider.of<UserBloc>(context).add(UserEventLoginWithUsername(
              _usernameController.text, _passController.text));
        },
      ),
      makeSpace(100),
      RButton(
        text: "Signin Google",
        onPressed: () {
          //BlocProvider.of<UserBloc>(context).add(UserEventLoginWithGoogle());
        },
      ),
      RButton(
        text: "Signin Anony",
        onPressed: () {
          //BlocProvider.of<UserBloc>(context).add(UserEventLoginWithAnony());
        },
      )
    ]);
  }
}
