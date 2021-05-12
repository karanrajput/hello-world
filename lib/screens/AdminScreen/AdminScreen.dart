import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/data/services/services.dart';
import 'package:bkdschool/screens/AdminScreen/SubScreens/AdminHomeScreen.dart';
import 'SubScreens/AdminClassScreen.dart';
import 'SubScreens/Pages/AdminAddClassPage.dart';
import 'SubScreens/Pages/AdminAddStudentPage.dart';
import 'SubScreens/AdminStudentsScreen.dart';
import 'SubScreens/Pages/AdminAddTeacherPage.dart';
import 'SubScreens/AdminTeachersScreen.dart';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  _onFABClicked() {
    switch (_currentPageIndex) {
      case 0:
        break;
      case 1:
        Globals.makeRPopup(AdminAddTeacherPage(), 'fab');
        break;
      case 2:
        Globals.makeRPopup(AdminAddClassPage(), 'fab');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "Admin Panel",
      fab: FloatingActionButton(
        heroTag: 'fab',
        onPressed: _onFABClicked,
        elevation: 0,
        child: Icon(Icons.add),
      ),
      fabLocation: FloatingActionButtonLocation.endDocked,
      bottomNavBar: BubbleBottomBar(
          backgroundColor: Colors.white.withAlpha(100),
          hasInk: true,
          elevation: 0,
          hasNotch: true,
          currentIndex: _currentPageIndex,
          onTap: (i) {
            _pageController.jumpToPage(i);
          },
          fabLocation: BubbleBottomBarFabLocation.end,
          items: [
            BubbleBottomBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                title: makeText("Home"),
                backgroundColor: Colors.red),
            BubbleBottomBarItem(
                icon: Icon(
                  Icons.people_alt_outlined,
                  color: Colors.black,
                ),
                title: makeText("Teachers"),
                backgroundColor: Colors.amber),
            BubbleBottomBarItem(
                icon: Icon(
                  Icons.apartment_outlined,
                  color: Colors.black,
                ),
                title: makeText("Classes"),
                backgroundColor: Colors.green),
          ],
          opacity: .5),
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (i) {
          setState(() {
            _currentPageIndex = i;
          });
        },
        children: [
          AdminHomeScreen(),
          AdminTeacherScreen(),
          AdminClassScreen(),
        ],
      ),
    );
  }
}
