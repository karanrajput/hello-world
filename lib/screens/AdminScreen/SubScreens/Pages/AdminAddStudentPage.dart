import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/repos/UserRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:email_validator/email_validator.dart';
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
      password: passwordController.text,
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

    await FireRepo.instance.createNewUser(ruser);

    Navigator.of(context).pop();
  }

  _updateStudentClicked(BuildContext context) {
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

    FireRepo.instance.updateUser(ruser..uid = widget.ruser.uid);

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
                label: "Username",
                controller: usernameController,
              ),
              makeSpace(5),
              RTextField(
                label: "Password",
                controller: passwordController,
                keyboardtype: TextInputType.visiblePassword,
              ),
              makeSpace(30),
              RTextField(
                label: "Name",
                controller: nameController,
                keyboardtype: TextInputType.name,
              ),
              makeSpace(5),
              RTextField(
                label: "Roll Number",
                controller: rollnoController,
                keyboardtype: TextInputType.number,
              ),
              makeSpace(5),
              RTextField(
                label: "Phone",
                controller: phoneController,
                keyboardtype: TextInputType.phone,
              ),
              makeSpace(5),
              RTextField(
                label: "Email",
                controller: emailController,
                keyboardtype: TextInputType.emailAddress,
              ),
              makeSpace(5),
              // Form(
              //   autovalidateMode: AutovalidateMode.always,
              //   child: TextFormField(
              //     validator: (value) => EmailValidator.validate(value)
              //         ? null
              //         : "Please enter a valid email",
              //   ),
              // ),
              makeSpace(5),
              RTextField(
                label: "Father Name",
                controller: fathernameController,
                keyboardtype: TextInputType.name,
              ),
              makeSpace(5),
              RTextField(
                label: "Mother Name",
                controller: mothernameController,
                keyboardtype: TextInputType.name,
              ),
              CheckboxListTile(
                  title: Text("List of Optional Subjects"),
                  value: false,
                  onChanged: (newValue) {}),
              makeSpace(20),
              isReadOnly
                  ? makeeditbuttons()
                  : RButton(
                      expand: true,
                      text: "Add",
                      padding: EdgeInsets.symmetric(vertical: 15),
                      onPressed: () => _addStudentClicked(context),
                    )
            ],
          ),
        ),
      ),
    );
  }

  makeeditbuttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: RButton(
            expand: true,
            text: "Delete",
            padding: EdgeInsets.symmetric(vertical: 15),
            onPressed: () {
              FireRepo.instance.deleteUser(widget.ruser);
              Navigator.pop(context);
            },
          ),
        ),
        VerticalDivider(),
        Expanded(
          child: RButton(
            color: Colors.green,
            expand: true,
            text: "Update",
            padding: EdgeInsets.symmetric(vertical: 15),
            onPressed: () => _updateStudentClicked(context),
          ),
        )
      ],
    );
  }
}
