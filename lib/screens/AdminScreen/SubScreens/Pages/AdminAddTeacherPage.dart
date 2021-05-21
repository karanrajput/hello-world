import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/repos/UserRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:flutter/material.dart';

class AdminAddTeacherPage extends StatefulWidget {
  final RUser ruser;

  const AdminAddTeacherPage({Key key, this.ruser}) : super(key: key);

  @override
  _AdminAddTeacherPageState createState() => _AdminAddTeacherPageState();
}

class _AdminAddTeacherPageState extends State<AdminAddTeacherPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final rollnoController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  bool isLoading = false;
  bool isReadOnly = false;

  _addTeacherClicked(BuildContext context) async {
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
      type: RUserType.TEACHER,
      password: passwordController.text,
      completeUser: true,
      username: usernameController.text,
    );

    await FireRepo.instance.createNewUser(ruser);

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
                label: "ID Number",
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
        onPressed: () => _addTeacherClicked(context),
        text: "Add Teacher",
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
