import 'package:bkdschool/zkaran/registration.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:bkdschool/zkaran/BuildItems.dart';
import 'package:bkdschool/zkaran/aboutdetails.dart';
import 'package:bkdschool/zkaran/allcategorydata.dart';
import 'package:bkdschool/zkaran/buttons.dart';
import 'package:bkdschool/zkaran/chatscreen.dart';
import 'package:bkdschool/zkaran/dashitem.dart';
import 'package:bkdschool/zkaran/notificationcard.dart';
import 'package:bkdschool/zkaran/prifilecard.dart';
import 'package:bkdschool/zkaran/profilecardmenu.dart';
import 'package:bkdschool/zkaran/tabview.dart';

class Hschool extends StatelessWidget {
  const Hschool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      sideBar: SideBar(
        items: const [
          MenuItem(
            title: 'Dashboard',
            route: '/',
            icon: Icons.dashboard,
          ),
          MenuItem(
            title: 'Top Level',
            icon: Icons.file_copy,
            children: [
              MenuItem(
                title: 'Second Level Item 1',
                route: '/secondLevelItem1',
              ),
              MenuItem(
                title: 'Second Level Item 2',
                route: '/secondLevelItem2',
              ),
              MenuItem(
                title: 'Third Level',
                children: [
                  MenuItem(
                    title: 'Third Level Item 1',
                    route: '/thirdLevelItem1',
                  ),
                  MenuItem(
                    title: 'Third Level Item 2',
                    route: '/thirdLevelItem2',
                  ),
                ],
              ),
            ],
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          Navigator.of(context).pushNamed(item.route);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: Colors.black26,
          child: Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: Colors.black26,
          child: Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chatscreen()),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ContactItem(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Tabview()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: DDtextfield()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: RButton(
                        text: "Register Screen",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registerscreen()),
                          );
                        })),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Rtextfield()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Aboutdetails()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Notificationcard()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Thinbutton()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: toatalitem()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: profilecard(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Menubutton(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: profilecardmenu()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Allcategorydata()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
