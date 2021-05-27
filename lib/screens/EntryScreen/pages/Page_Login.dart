import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passController = TextEditingController();

  _loginClick(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(UserEventLoginWithUsername(
        _usernameController.text, _passController.text));
  }

  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();
    return makeScroll(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          makeText("Welcome,", fontSize: 50),
          makeText("Sign in to BKD School", fontSize: 20, color: Colors.grey),
          makeSpace(100),
          makeCardContainer(
            child: Column(
              children: [
                rTextField(
                  controller: _usernameController,
                  hint: "enter your username",
                  label: "Username",
                  showNextButton: true,
                  onSubmit: (_) => focus.requestFocus(focus),
                ),
                makeSpace(20),
                rTextField(
                  controller: _passController,
                  focusNode: focus,
                  obscureText: true,
                  hint: "enter your password",
                  label: "Password",
                ),
                makeSpace(80),
                RButton(
                  padding: EdgeInsets.all(20),
                  expand: true,
                  text: "Login",
                  onPressed: () {
                    _loginClick(context);
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
