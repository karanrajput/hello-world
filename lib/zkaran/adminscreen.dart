import 'package:bkdschool/zkaran/Screens/adminhome.dart';
import 'package:bkdschool/zkaran/Screens/allclasslist.dart';
import 'package:bkdschool/zkaran/Screens/allteacherlist.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Adminscreen extends StatefulWidget {
  const Adminscreen({Key key}) : super(key: key);

  @override
  _AdminscreenState createState() => _AdminscreenState();
}

/// This is the private State class that goes with Adminscreen.
class _AdminscreenState extends State<Adminscreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Adminhome(),
    Allteachers(),
    Allclasslist(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/g.png"), fit: BoxFit.fill),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: 'Home',
              backgroundColor: Color.fromARGB(0, 54, 186, 162),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                size: 35,
              ),
              label: 'Teachers',
              backgroundColor: Color.fromARGB(150, 99, 55, 55),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                size: 35,
              ),
              label: 'Students',
              backgroundColor: Color.fromARGB(150, 70, 55, 99),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 35,
              ),
              label: 'Settings',
              backgroundColor: Color.fromARGB(150, 94, 84, 47),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
