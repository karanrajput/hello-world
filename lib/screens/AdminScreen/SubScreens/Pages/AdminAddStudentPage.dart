import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/repos/UserRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAddStudentPage extends StatefulWidget {
  final RUser ruser;
  final RClass rclass;

  const AdminAddStudentPage({Key key, this.ruser, this.rclass})
      : super(key: key);

  @override
  _AdminAddStudentPageState createState() => _AdminAddStudentPageState();
}

class _AdminAddStudentPageState extends State<AdminAddStudentPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final fathernameController = TextEditingController();
  final mothernameController = TextEditingController();
  final rollnoController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  bool isLoading = false;
  bool isReadOnly = false;

  _addStudentClicked(BuildContext context) async {
    //TODO: Add Validation of fields

    setState(() {
      isLoading = true;
    });
    //Checks if username already exists
    bool isAlreadyRegistered =
        await FireRepo.instance.isRegisteredUser(usernameController.text);
    if (isAlreadyRegistered) {
      Globals.showSnackbar(context, "Username Already Exists");
      setState(() {
        isLoading = false;
      });
      return;
    }

    var ruser = RUser(
      rollno: rollnoController.text,
      name: nameController.text,
      contactnumber: phoneController.text,
      email: emailController.text,
      fathername: fathernameController.text,
      mothername: mothernameController.text,
      type: RUserType.STUDENT,
      completeUser: true,
      username: usernameController.text,
      classaccess: widget.rclass.docid,
    );

    bool result =
        await UserRepo.signUpWithUsername(ruser, passwordController.text);
    if (!result) {
      Globals.showSnackbar(context, "Student Creation Failed");
    }

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    if (widget.ruser != null) {
      isReadOnly = true;
      rollnoController.text = widget.ruser.rollno;
      usernameController.text = widget.ruser.username;
      nameController.text = widget.ruser.name;
      fathernameController.text = widget.ruser.fathername;
      mothernameController.text = widget.ruser.mothername;
      phoneController.text = widget.ruser.contactnumber;
      emailController.text = widget.ruser.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return makeCardContainer(
      alpha: 240,
      child: Material(
        color: Colors.transparent,
        child: makeScroll(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RTextField(
                isReadOnly: isReadOnly,
                label: "Username",
                controller: usernameController,
              ),
              makeSpace(5),
              RTextField(
                isReadOnly: isReadOnly,
                label: "Password",
                controller: passwordController,
                keyboardtype: TextInputType.visiblePassword,
              ),
              makeSpace(30),
              RTextField(
                isReadOnly: isReadOnly,
                label: "Name",
                controller: nameController,
                keyboardtype: TextInputType.name,
              ),
              makeSpace(5),
              RTextField(
                isReadOnly: isReadOnly,
                label: "Roll Number",
                controller: rollnoController,
                keyboardtype: TextInputType.number,
              ),
              makeSpace(5),
              RTextField(
                isReadOnly: isReadOnly,
                label: "Phone",
                controller: phoneController,
                keyboardtype: TextInputType.phone,
              ),
              makeSpace(5),
              RTextField(
                isReadOnly: isReadOnly,
                label: "Email",
                controller: emailController,
                keyboardtype: TextInputType.emailAddress,
              ),
              makeSpace(5),
              RTextField(
                isReadOnly: isReadOnly,
                label: "Father Name",
                controller: fathernameController,
                keyboardtype: TextInputType.name,
              ),
              makeSpace(5),
              RTextField(
                isReadOnly: isReadOnly,
                label: "Mother Name",
                controller: mothernameController,
                keyboardtype: TextInputType.name,
              ),
              makeSpace(20),
              _makeButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _makeButton() {
    if (isReadOnly) {
      return RButton(
        text: "Edit",
        enabled: !isLoading,
        expand: true,
        color: Colors.black26,
        textColor: Colors.black,
        child: isLoading
            ? CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            : null,
        padding: EdgeInsets.symmetric(vertical: 15),
      );
    } else {
      return RButton(
        onPressed: () => _addStudentClicked(context),
        text: "Add Student",
        enabled: !isLoading,
        expand: true,
        child: isLoading
            ? CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            : null,
        padding: EdgeInsets.symmetric(vertical: 15),
      );
    }
  }
}
