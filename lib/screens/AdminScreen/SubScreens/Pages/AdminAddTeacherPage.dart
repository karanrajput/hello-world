import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
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
    //validation
    if (usernameController.text.length < 4) {
      Globals.showSnackbar(context, "Username less then 4 Characters");
      return;
    }
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

  _updateTeacherClicked(BuildContext context) {
    var ruser = RUser(
      rollno: rollnoController.text,
      name: nameController.text,
      contactnumber: phoneController.text,
      email: emailController.text,
      type: RUserType.TEACHER,
      completeUser: true,
      username: usernameController.text,
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
              rTextField(
                label: "Username",
                controller: usernameController,
              ),
              makeSpace(5),
              rTextField(
                label: "Password",
                controller: passwordController,
                keyboardtype: TextInputType.visiblePassword,
              ),
              makeSpace(30),
              rTextField(
                label: "Name",
                controller: nameController,
                keyboardtype: TextInputType.name,
              ),
              makeSpace(5),
              rTextField(
                label: "ID Number",
                controller: rollnoController,
                keyboardtype: TextInputType.number,
              ),
              makeSpace(5),
              rTextField(
                label: "Phone",
                controller: phoneController,
                keyboardtype: TextInputType.phone,
              ),
              makeSpace(5),
              rTextField(
                label: "Email",
                controller: emailController,
                keyboardtype: TextInputType.emailAddress,
              ),
              makeSpace(20),
              isReadOnly
                  ? makeeditbuttons()
                  : RButton(
                      expand: true,
                      text: "Add",
                      padding: EdgeInsets.symmetric(vertical: 15),
                      onPressed: () => _addTeacherClicked(context),
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
            onPressed: () => _updateTeacherClicked(context),
          ),
        )
      ],
    );
  }
}
